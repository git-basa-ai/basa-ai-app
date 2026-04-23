---
name: backend-design
description: Build and integrate BASA AI backend services in Flutter using offline-first Hive storage, Firebase Auth/Firestore/Storage sync, and third-party AI/ML service wrappers (speech_to_text, google_mlkit_barcode_scanning, FaceMesh bridge). Use this skill when the user asks to: replace mock providers with real repositories, implement HiveInitializer and encrypted boxes, wire syncQueueBox and conflict resolution, add Firebase role-based auth flows (learner/teacher/coordinator), create Firestore mappers/repositories, implement resilient API clients with offline fallback, or harden backend architecture/testing in this project.
---

# BASA AI Backend Integration Skill

## What This Skill Produces

A production-ready backend slice for BASA AI that:

- Preserves offline-first behavior (Hive write first, sync later)
- Uses clean architecture boundaries (presentation -> domain -> data -> infrastructure)
- Enforces learner safety and data integrity constraints from orchestration rules
- Replaces mock Riverpod providers with real service-backed providers
- Adds testable wrappers for Firebase and AI/ML SDK dependencies

## Project-Specific Ground Truth

Use these as source of truth before implementation:

- .github/docs/ARCHITECTURE.md
- .github/docs/RULES.md
- .github/docs/TODO.md
- .github/docs/hive_type_adapter_registry.md
- .github/docs/sync_conflict_resolution_strategy.md
- lib/infrastructure/hive/boxes.dart

Current state this skill assumes:

- UI and most providers exist and are mock-backed
- lib/infrastructure/firebase and lib/infrastructure/sync are scaffolded only
- Hive box constants are defined, but initializer/adapters/services are still pending

## Workflow

1. Preflight: Confirm constraints before coding

- Read orchestration rule docs and check non-negotiables (A1-A7, D1-D6, S1-S8).
- Confirm target feature and which mock providers/repositories will be replaced.
- Confirm no direct Hive/Firebase SDK calls from widgets/providers.

2. Define domain contracts first

- Add or update repository interfaces in domain layer.
- Ensure entities remain framework-agnostic (pure Dart).
- Define use cases per user action (example: save progress, queue sync, pull lessons).

3. Implement local data layer (Hive-first)

- Create Hive models/adapters and register typeIds from adapter registry doc.
- Implement HiveInitializer with encrypted and non-encrypted box opening.
- Store encryption key in FlutterSecureStorage; never in source.
- Write local repository implementations for learners/progress/struggle words/settings.

4. Add sync queue behavior for every offline write

- After local write, append SyncRecord to syncQueueBox.
- Include collection, documentId, serialized payload, operation, queuedAt, retryCount.
- Add lastModified on all syncable documents.
- Keep writes idempotent so retries are safe.

5. Implement Firebase remote layer

- Add FirebaseAuth service wrapper for learner/teacher/coordinator flows.
- Add Firestore client/repositories with mappers between Hive/domain/Firestore shapes.
- Enforce role-based collection paths and guard assumptions in repository logic.

6. Implement SyncService (push + pull)

- Trigger sync on app foreground, connectivity restore, and periodic online tick.
- Push queue in batches; on success delete queue item and mark local record synced.
- Retry with exponential backoff up to max retries; never drop learner data.
- Pull remote lesson/dictionary updates and persist to local cache boxes.

7. Wrap AI/ML integrations behind infrastructure services

- Speech recognition service: timeout, cancellation, and user-friendly fallback.
- QR scanning service: sanitize payload and fail gracefully.
- FaceMesh bridge service: on-device pathway and safe no-camera fallback.
- Do not expose SDK-specific responses directly to presentation layer.

8. Wire Riverpod from mock to real incrementally

- Replace mock providers with repository-backed providers feature-by-feature.
- Keep provider API stable where possible to minimize UI churn.
- Add loading/error states that preserve encouraging learner messaging.

9. Validate with backend quality gates

- Unit tests for repositories, mappers, and sync conflict handling.
- Integration tests for Hive open/read/write and queue processing.
- Verify no secrets in repo and no PII leakage in logs.
- Verify offline flows pass without network.

## Decision Logic

- If data contains PII (LRN, learner identifiers, sensitive progress metadata):
  - Use encrypted Hive boxes + secure key storage.
- If operation mutates learner progress:
  - Write to Hive first, then queue sync; never remote-first.
- If connectivity is unavailable:
  - Complete local transaction and return success state with pending-sync indicator.
- If sync retry exceeds threshold:
  - Keep retrying in the background and flag for teacher review; do not discard.
- If third-party AI/ML service is unavailable:
  - Degrade gracefully with child-friendly messaging and optional offline alternative.
- If introducing a new backend dependency:
  - Wrap dependency in infrastructure interface before using it in data layer.

## Preferred Implementation Order

1. Hive initializer + encrypted local repositories
2. Firebase auth + role routing
3. Sync queue + conflict resolution
4. AI/ML wrappers

## Definition of Done

- No feature widget imports Hive/Firebase/SDK packages directly.
- All syncable writes include lastModified and queue records.
- SyncService can recover from app restart and duplicate queue replay.
- Auth flows cover learner, teacher, coordinator role paths.
- Firestore rules assumptions are reflected in repository access patterns.
- Mock providers targeted in the task are replaced with real implementations.
- Tests added or updated for new backend logic and edge cases.
- Lints and tests pass for touched modules.

## Common Failure Patterns To Avoid

- Implementing remote writes before local persistence
- Storing encryption keys in plain text or committed config
- Bypassing repository layer in Riverpod notifiers/providers
- Treating retries as optional and dropping failed queue records
- Returning raw plugin response objects outside infrastructure layer

## Suggested Prompt Invocations

- "Use backend-design to replace MockAuthProvider with Firebase auth and role-aware repository wiring."
- "Use backend-design to implement HiveInitializer, encrypted boxes, and adapter registration."
- "Use backend-design to build SyncService with retry/backoff and conflict handling."
- "Use backend-design to wire speech + scanner services with graceful offline fallback."
