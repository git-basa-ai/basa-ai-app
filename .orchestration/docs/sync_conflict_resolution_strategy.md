# Sync Conflict Resolution Strategy — BASA AI

> Authored by: ARCHITECT
> Phase: 2 — System Design
> Status: Finalized

---

## Overview

BASA AI follows an **offline-first** data architecture. All learner interactions write to local Hive boxes immediately and are queued for Firestore sync via `syncQueueBox`. This document defines how conflicts are detected and resolved when syncing between Hive (local) and Firestore (remote).

---

## Guiding Principles

1. **Hive is always the local source of truth** for the current device session
2. **Firestore is the canonical remote source of truth** for cross-device and teacher views
3. **No data loss** — a sync failure must never discard a learner's progress (Rule D2)
4. **Last-write-wins** — the record with the most recent `lastModified` timestamp prevails
5. **Learner progress is append-mostly** — session records are rarely updated after creation

---

## Data Flow

```
┌─────────────────┐         ┌──────────────────┐         ┌─────────────────┐
│   LEARNER APP   │         │   syncQueueBox    │         │    FIRESTORE    │
│   (Hive boxes)  │────────►│   (pending sync)  │────────►│   (remote DB)   │
│                 │  write   │                  │  batch   │                 │
│                 │◄─────────│                  │  write   │                 │
│                 │  on pull │                  │         │                 │
└─────────────────┘         └──────────────────┘         └─────────────────┘
```

---

## Conflict Scenarios & Resolution

### Scenario 1: Normal Sync (No Conflict)

**Condition**: Device is online; no competing writes from another device.

```
1. Learner completes lesson → write to progressBox (synced = false)
2. SyncRecord created in syncQueueBox
3. SyncService reads syncQueueBox → batch write to Firestore
4. Firestore accepts write → SyncRecord deleted from syncQueueBox
5. Hive record marked synced = true
```

**Resolution**: None needed — standard happy path.

---

### Scenario 2: Duplicate Session from Same Device

**Condition**: App crashes mid-sync; `syncQueueBox` record persists; app restarts and retries.

```
1. SyncService picks up existing SyncRecord on restart
2. Attempts Firestore write with same documentId
3. Firestore set() with merge overwrites with identical data
```

**Resolution**: **Idempotent write** — Firestore `set()` with `SetOptions(merge: true)` ensures duplicate pushes produce the same state. No conflict.

---

### Scenario 3: Competing Writes from Different Devices (Same Learner)

**Condition**: Learner uses two tablets (e.g., home and school). Both submit progress for the same lesson while offline, then sync.

```
Device A: lessonId=L1, score=80, lastModified=T1
Device B: lessonId=L1, score=90, lastModified=T2 (T2 > T1)
```

**Resolution**: **Last-write-wins with `lastModified` comparison**.

```dart
// Firestore security rule pattern:
// Allow write only if incoming lastModified > stored lastModified
allow write: if request.resource.data.lastModified > resource.data.lastModified
             || !exists(resource);
```

**Implementation in SyncService**:

```
1. Before writing, read current Firestore document
2. If remote.lastModified >= local.lastModified → skip write (remote is newer)
3. If local.lastModified > remote.lastModified → write local to Firestore
4. If document does not exist → create it
```

**Edge case — identical timestamps**: If `lastModified` values are equal, the **higher score** wins (learner-favorable). This prevents a lower score from overwriting a better attempt.

---

### Scenario 4: Teacher Updates Learner Data While Learner Is Offline

**Condition**: Teacher reassigns learner to a different section via dashboard. Learner's device still has old section cached in Hive.

```
1. Teacher writes to /learners/{uid} → section = "Section B"
2. Learner comes online → SyncService pulls latest /learners/{uid}
3. Local Hive learnersBox updated with remote data
```

**Resolution**: **Remote wins for profile/metadata fields**. Teacher-controlled fields (`grade`, `section`, `school`, `enrolledBy`) always take the remote Firestore value on pull. Learner-generated fields (`progress`, `struggleWords`) follow last-write-wins.

**Field classification**:

| Field Category   | Owned By | Conflict Winner    |
| ---------------- | -------- | ------------------ |
| Profile metadata | Teacher  | Remote (Firestore) |
| Progress records | Learner  | Last-write-wins    |
| Struggle words   | Learner  | Last-write-wins    |
| Lesson content   | Admin    | Remote (Firestore) |
| App settings     | Learner  | Local (Hive)       |

---

### Scenario 5: Sync Queue Overflow (Extended Offline Period)

**Condition**: Device is offline for days/weeks; `syncQueueBox` accumulates many records.

**Resolution**:

1. SyncService processes records in **chronological order** (`queuedAt` ascending)
2. Batch size: maximum **500 writes per Firestore batch** (Firestore limit)
3. Between batches: **200ms delay** to avoid rate limiting
4. Progress indicator available in teacher dashboard ("Last sync: X days ago")

---

### Scenario 6: Permanent Sync Failure

**Condition**: A SyncRecord fails 5 consecutive times (network error, permission denied, etc.).

**Resolution**:

1. After 5 retries, the record is **flagged** (`retryCount >= 5`) but **never deleted** (Rule D2)
2. A `SyncFailure` event is written to a local `syncErrorsBox` for diagnostics
3. Teacher dashboard shows "Sync issue" indicator for affected learner
4. Manual resolution: Admin can trigger force-sync or export local data

---

## Retry Strategy

```
Attempt 1: Immediate
Attempt 2: Wait 2 seconds
Attempt 3: Wait 4 seconds
Attempt 4: Wait 8 seconds
Attempt 5: Wait 16 seconds
After 5:   Flag as failed; stop retrying; await manual intervention
```

**Backoff formula**: `delay = 2^(retryCount) seconds` (exponential backoff, capped at 16s).

---

## Timestamp Management

- All timestamps use **UTC** (`DateTime.now().toUtc()`)
- `lastModified` is set **at the moment of local Hive write**, not at sync time
- Firestore server timestamps (`FieldValue.serverTimestamp()`) are used **only** for `syncedAt` metadata fields, never for conflict resolution
- Device clock skew: accepted risk for single-user sessions; mitigated by teacher-controlled metadata always using remote values

---

## Implementation Checklist

- [ ] `SyncService` reads `syncQueueBox` in `queuedAt` order
- [ ] `SyncService` implements exponential backoff (2^n seconds, max 5 retries)
- [ ] `SyncService` uses `SetOptions(merge: true)` for idempotent writes
- [ ] `SyncService` compares `lastModified` before writing progress records
- [ ] `SyncService` pulls teacher-controlled fields from Firestore on app launch
- [ ] `SyncService` never deletes a `SyncRecord` until Firestore confirms the write (Rule D3)
- [ ] `SyncService` flags records with `retryCount >= 5` without deleting (Rule D2)
- [ ] All Firestore documents include `lastModified` on every write (Rule D4)
