# ARCHITECTURE — BASA AI

## Purpose

This document defines the complete technical architecture of **BASA AI** — a hybrid Flutter reading intervention app for early-grade Filipino learners. All agent personas (ARCHITECT, DEVELOPER, QA, REVIEWER) must treat this as the single source of architectural truth.

---

## System Overview

```
┌──────────────────────────────────────────────────────────────────┐
│                         BASA AI SYSTEM                           │
│                                                                  │
│  ┌─────────────────────────┐      ┌──────────────────────────┐  │
│  │      FLUTTER APP         │      │    FIREBASE BACKEND       │  │
│  │   (Dart / Riverpod)      │◄────►│  Auth + Firestore + Rules │  │
│  │                          │ sync │  Firebase Storage         │  │
│  │  ┌───────────────────┐   │      └──────────────────────────┘  │
│  │  │   HIVE (offline)  │   │                                    │
│  │  │  learnersBox      │   │      ┌──────────────────────────┐  │
│  │  │  progressBox      │   │      │     THIRD-PARTY APIs      │  │
│  │  │  lessonsBox       │   │      │                          │  │
│  │  │  dictionaryBox    │   │      │  • Google Speech API     │  │
│  │  │  struggleWordsBox │   │      │  • MediaPipe FaceMesh    │  │
│  │  │  syncQueueBox     │   │      │  • Google ML Kit Barcode │  │
│  │  └───────────────────┘   │      └──────────────────────────┘  │
│  └─────────────────────────┘                                     │
└──────────────────────────────────────────────────────────────────┘
```

---

## Clean Architecture Layers

```
┌──────────────────────────────────────────────────────┐
│               PRESENTATION LAYER                     │
│  Flutter Widgets · Screens · Riverpod Providers      │
│  GoRouter · Lottie Animations · AppTheme             │
├──────────────────────────────────────────────────────┤
│               DOMAIN LAYER                           │
│  Use Cases · Entities · Repository Interfaces        │
│  (Pure Dart — no Flutter, no Hive, no Firebase)      │
├──────────────────────────────────────────────────────┤
│               DATA LAYER                             │
│  Repository Implementations                          │
│  LocalDataSource (Hive) · RemoteDataSource (Firestore│
│  SyncService · HiveAdapters · Firestore Mappers      │
├──────────────────────────────────────────────────────┤
│               INFRASTRUCTURE LAYER                   │
│  HiveInitializer · FirebaseAuthClient                │
│  SpeechApiClient · FaceMeshService · MLKitBarcodeService│
│  SyncQueueProcessor · EncryptionKeyStore             │
└──────────────────────────────────────────────────────┘
```

**Law**: Dependencies point inward only. Domain never imports from Data or Infrastructure.

---

## Flutter Project Structure

```
lib/
├── main.dart                        # App entry; Hive init; Firebase init; ProviderScope
├── app/
│   ├── app.dart                     # MaterialApp.router
│   ├── router.dart                  # GoRouter — all routes defined here
│   └── theme/
│       ├── colors.dart              # AppColors (all BASA AI color tokens)
│       ├── typography.dart          # AppTypography (Nunito scales)
│       └── theme.dart               # ThemeData (light theme)
│
├── features/
│   ├── auth/
│   ├── learner/
│   ├── phonics/
│   ├── speech/
│   ├── face_mesh/
│   ├── scanner/
│   ├── dictionary/
│   ├── progress/
│   └── teacher/
│       (each feature: presentation/ · domain/ · data/)
│
├── shared/
│   ├── widgets/                     # Bibo mascot, ActivityCard, AnswerTile, XpBar
│   ├── providers/                   # Auth state, network state, sync state
│   └── utils/                       # Constants, NetworkChecker, EncryptionUtils
│
└── infrastructure/
    ├── hive/
    │   ├── hive_initializer.dart    # openBox calls; cipher setup
    │   ├── adapters/                # All @HiveType TypeAdapters
    │   └── boxes.dart               # Box name constants
    ├── firebase/
    │   ├── firestore_client.dart
    │   └── firebase_auth_client.dart
    └── sync/
        └── sync_service.dart        # syncQueueBox → Firestore batch write
```

---

## Hive Box Schema

| Box Name           | TypeAdapter              | Encrypted | Contents                                     |
| ------------------ | ------------------------ | --------- | -------------------------------------------- |
| `learnersBox`      | `LearnerAdapter`         | ✅ Yes    | Learner profiles (LRN, name, grade, section) |
| `progressBox`      | `ProgressAdapter`        | ✅ Yes    | Lesson scores, attempts, completion status   |
| `struggleWordsBox` | `StruggleWordAdapter`    | ✅ Yes    | Words with ≥3 failed attempts                |
| `lessonsBox`       | `LessonAdapter`          | ❌ No     | Cached lesson content (phonemes, audio refs) |
| `dictionaryBox`    | `DictionaryEntryAdapter` | ❌ No     | Picture dictionary word list + audio paths   |
| `syncQueueBox`     | `SyncRecordAdapter`      | ✅ Yes    | Pending Firestore write operations           |
| `settingsBox`      | (Map<String,dynamic>)    | ❌ No     | App settings (volume, language, theme)       |

### Key Hive Data Models

```dart
@HiveType(typeId: 0)
class LearnerModel extends HiveObject {
  @HiveField(0) String uid;          // Firebase Auth UID
  @HiveField(1) String lrn;          // Learner Reference Number
  @HiveField(2) String name;
  @HiveField(3) int grade;
  @HiveField(4) String section;
  @HiveField(5) bool synced;
}

@HiveType(typeId: 1)
class ProgressModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String learnerId;    // Firebase UID
  @HiveField(2) String lessonId;
  @HiveField(3) double score;
  @HiveField(4) int attempts;
  @HiveField(5) bool completed;
  @HiveField(6) DateTime sessionDate;
  @HiveField(7) bool synced;
}

@HiveType(typeId: 2)
class StruggleWordModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String learnerId;
  @HiveField(2) String word;
  @HiveField(3) int failCount;
  @HiveField(4) DateTime lastSeen;
  @HiveField(5) bool synced;
}

@HiveType(typeId: 3)
class SyncRecordModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String collection;   // Firestore collection name
  @HiveField(2) String documentId;
  @HiveField(3) Map<String, dynamic> data;
  @HiveField(4) DateTime queuedAt;
  @HiveField(5) int retryCount;
}
```

---

## Firestore Collection Schema

```
/learners/{uid}
  - lrn, name, grade, section, school, enrolledBy, createdAt

/learners/{uid}/progress/{sessionId}
  - lessonId, score, attempts, completed, sessionDate, lastModified

/learners/{uid}/struggleWords/{wordId}
  - word, failCount, lastSeen, lastModified

/classes/{classId}
  - teacherUid, grade, section, school, learnerUids[], createdAt

/lessons/{lessonId}
  - title, phoneme, approach (marungko|cvc), level, contentUrl, isActive

/schools/{schoolId}
  - name, address, coordinatorUid, classIds[]
```

---

## Hive ↔ Firestore Sync Strategy

```
1. Learner action (lesson complete, word attempt, XP gain):
   → Write to Hive box immediately (never block on network)
   → Add SyncRecord to syncQueueBox (synced = false)

2. SyncService triggers:
   → On app foreground (connectivity detected)
   → On network connectivity restored (listen to Connectivity stream)
   → Every 10 minutes while online (periodic timer in background isolate)

3. SyncService processing:
   → Read all SyncRecords from syncQueueBox
   → Batch write to Firestore (max 500 writes per batch)
   → On success: delete SyncRecord from syncQueueBox
   → On failure: increment retryCount; retry with exponential backoff
   → Max retries: 5; after 5 failures, flag for manual review

4. Conflict resolution:
   → All progress records include lastModified timestamp
   → Firestore accepts write if incoming lastModified > stored lastModified
   → Local Hive is always source of truth for unsynced sessions

5. Firestore → Hive (pull):
   → Teacher-side content updates (new lessons, word list changes)
   → Pulled on app launch when online; stored in lessonsBox + dictionaryBox
```

---

## Firebase Security Rules (Pattern)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Learner: read/write own documents only
    match /learners/{uid} {
      allow read, write: if request.auth.uid == uid;

      match /progress/{sessionId} {
        allow read, write: if request.auth.uid == uid;
      }
      match /struggleWords/{wordId} {
        allow read, write: if request.auth.uid == uid;
      }
    }

    // Teacher: read learners in their class
    match /learners/{uid} {
      allow read: if isTeacherOfLearner(uid);
    }

    // Lessons: read by any authenticated user, write by admin only
    match /lessons/{lessonId} {
      allow read: if request.auth != null;
      allow write: if isAdmin();
    }

    // Classes: read/write by assigned teacher or admin
    match /classes/{classId} {
      allow read, write: if isTeacherOfClass(classId) || isAdmin();
    }
  }
}
```

---

## API Integration Contracts

### Google Speech Recognition

- **Trigger**: Learner taps "Speak Now" button; `SpeechService.startListening()`
- **Input**: Audio stream from device microphone
- **Output**: Transcribed string → compared to target phoneme/word
- **Timeout**: 5 seconds; show Bibo retry bubble on timeout
- **Store**: Result saved to Hive `progressBox` before any Firestore write
- **Offline**: Feature gracefully disabled; show "Internet needed for voice practice 🎤"

### MediaPipe FaceMesh

- **Trigger**: Articulation practice screen mounts
- **Processing**: On-device (no network required)
- **Output**: Lip landmark coordinates → mapped to animated phoneme shape overlay
- **Offline**: Fully functional (on-device ML)

### Google ML Kit Barcode Scanning

- **Trigger**: Learner taps "Scan Book QR" button
- **Output**: Story ID string from QR payload
- **Action**: Unlock story content from `dictionaryBox` / local asset
- **Offline**: Fully functional (on-device ML Kit)

### Firebase Authentication

- **Learner**: LRN → resolve to Firebase UID → Firebase anonymous sign-in with UID binding
- **Teacher**: Email + password → Firebase email auth → role claim verification
- **Session**: Persistent `idToken`; auto-refresh via Firebase SDK
- **Logout**: Clear Firebase session; clear in-memory providers; preserve Hive data

---

## Minimum Supported Targets

| Platform       | Minimum Version      |
| -------------- | -------------------- |
| Android        | API 26 (Android 8.0) |
| iOS (optional) | iOS 14+              |
| Flutter SDK    | 3.x (stable channel) |
| Dart SDK       | 3.x                  |

---

## Non-Negotiable Architecture Rules

1. **Offline-first**: All learner features work via Hive without internet
2. **Clean architecture**: Widgets never call Hive or Firestore directly
3. **Riverpod**: All state managed through providers — no raw `setState` for feature state
4. **Encrypted boxes**: All PII Hive boxes use `HiveAesCipher`
5. **No credentials in source**: All secrets via `--dart-define` or `.env` (gitignored)
6. **Learner isolation**: Firebase rules prevent cross-learner data access
7. **Graceful degradation**: Any missing API response → informative UI, never crash
8. **Sync queue**: All offline writes queued in `syncQueueBox` — never fire-and-forget
