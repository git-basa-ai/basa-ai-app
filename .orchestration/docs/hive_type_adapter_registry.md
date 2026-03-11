# Hive TypeAdapter Registry — BASA AI

> Authored by: ARCHITECT
> Phase: 2 — System Design
> Status: Finalized

---

## Overview

This document is the **single source of truth** for all Hive TypeAdapter registrations in BASA AI. Every `@HiveType` must have a unique `typeId` assigned here before implementation. Duplicate typeIds will cause runtime crashes.

---

## TypeId Allocation Table

| typeId | Model Class            | Hive Box           | Encrypted | Description                                     |
| ------ | ---------------------- | ------------------ | --------- | ----------------------------------------------- |
| 0      | `LearnerModel`         | `learnersBox`      | ✅ Yes    | Learner profile (LRN, name, grade, section)     |
| 1      | `ProgressModel`        | `progressBox`      | ✅ Yes    | Lesson session scores and completion status     |
| 2      | `StruggleWordModel`    | `struggleWordsBox` | ✅ Yes    | Words failed ≥ 3 times by a learner             |
| 3      | `SyncRecordModel`      | `syncQueueBox`     | ✅ Yes    | Pending Firestore write operations              |
| 4      | `LessonModel`          | `lessonsBox`       | ❌ No     | Cached lesson content (phonemes, audio refs)    |
| 5      | `DictionaryEntryModel` | `dictionaryBox`    | ❌ No     | Picture dictionary entries (word, image, audio) |
| 6      | `AchievementModel`     | `progressBox`      | ✅ Yes    | Earned badges and milestones                    |
| 7      | `QuizAttemptModel`     | `progressBox`      | ✅ Yes    | Individual quiz question attempt records        |
| 8      | `PhonemeModel`         | `lessonsBox`       | ❌ No     | Individual phoneme definitions (Marungko)       |

**Reserved range**: typeIds 9–19 are reserved for future models. Do not use without ARCHITECT approval.

---

## Model Definitions

### typeId 0 — `LearnerModel`

```dart
@HiveType(typeId: 0)
class LearnerModel extends HiveObject {
  @HiveField(0) late String uid;          // Firebase Auth UID
  @HiveField(1) late String lrn;          // Learner Reference Number (PII — encrypted box)
  @HiveField(2) late String name;         // Display name
  @HiveField(3) late int grade;           // Grade level (1 or 2)
  @HiveField(4) late String section;      // Class section
  @HiveField(5) late bool synced;         // True if synced to Firestore
  @HiveField(6) late int xp;             // Current experience points
  @HiveField(7) late int level;          // Current level
  @HiveField(8) late DateTime createdAt;  // Account creation date
  @HiveField(9) late DateTime lastModified;
}
```

### typeId 1 — `ProgressModel`

```dart
@HiveType(typeId: 1)
class ProgressModel extends HiveObject {
  @HiveField(0) late String id;           // Unique session ID
  @HiveField(1) late String learnerId;    // Firebase UID
  @HiveField(2) late String lessonId;     // Lesson reference
  @HiveField(3) late double score;        // 0.0 – 100.0
  @HiveField(4) late int attempts;        // Number of attempts this session
  @HiveField(5) late bool completed;      // Lesson marked as completed
  @HiveField(6) late DateTime sessionDate;
  @HiveField(7) late bool synced;
  @HiveField(8) late DateTime lastModified;
  @HiveField(9) late int xpEarned;       // XP gained this session
}
```

### typeId 2 — `StruggleWordModel`

```dart
@HiveType(typeId: 2)
class StruggleWordModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String learnerId;    // Firebase UID
  @HiveField(2) late String word;         // The struggle word
  @HiveField(3) late int failCount;       // Number of failed attempts
  @HiveField(4) late DateTime lastSeen;   // Last attempt date
  @HiveField(5) late bool synced;
  @HiveField(6) late String phoneme;      // Associated phoneme
  @HiveField(7) late DateTime lastModified;
}
```

### typeId 3 — `SyncRecordModel`

```dart
@HiveType(typeId: 3)
class SyncRecordModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String collection;   // Firestore collection path
  @HiveField(2) late String documentId;   // Firestore document ID
  @HiveField(3) late Map<String, dynamic> data; // Serialized document data
  @HiveField(4) late DateTime queuedAt;   // When the record was queued
  @HiveField(5) late int retryCount;      // Current retry attempt (0–5)
  @HiveField(6) late String operation;    // 'create' | 'update' | 'delete'
}
```

### typeId 4 — `LessonModel`

```dart
@HiveType(typeId: 4)
class LessonModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String title;        // e.g., "Sounds of the Letter B"
  @HiveField(2) late String phoneme;      // e.g., "b"
  @HiveField(3) late String approach;     // 'marungko' | 'cvc'
  @HiveField(4) late int level;           // Sequential level number
  @HiveField(5) late String contentUrl;   // Firebase Storage path for assets
  @HiveField(6) late bool isActive;       // Enabled by admin
  @HiveField(7) late int order;           // Display order in lesson list
  @HiveField(8) late String description;  // Short lesson description
}
```

### typeId 5 — `DictionaryEntryModel`

```dart
@HiveType(typeId: 5)
class DictionaryEntryModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String word;         // The dictionary word
  @HiveField(2) late String imageUrl;     // Illustration asset path
  @HiveField(3) late String audioUrl;     // Pronunciation audio path
  @HiveField(4) late String phoneme;      // Primary phoneme
  @HiveField(5) late String category;     // e.g., 'animals', 'objects', 'actions'
  @HiveField(6) late String letter;       // First letter (for alphabet filter)
}
```

### typeId 6 — `AchievementModel`

```dart
@HiveType(typeId: 6)
class AchievementModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String learnerId;
  @HiveField(2) late String title;        // e.g., "First Lesson Complete!"
  @HiveField(3) late String icon;         // Asset path for badge icon
  @HiveField(4) late DateTime earnedAt;
  @HiveField(5) late bool synced;
  @HiveField(6) late DateTime lastModified;
}
```

### typeId 7 — `QuizAttemptModel`

```dart
@HiveType(typeId: 7)
class QuizAttemptModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String learnerId;
  @HiveField(2) late String lessonId;
  @HiveField(3) late String questionId;
  @HiveField(4) late String selectedAnswer;
  @HiveField(5) late String correctAnswer;
  @HiveField(6) late bool isCorrect;
  @HiveField(7) late DateTime attemptedAt;
  @HiveField(8) late bool synced;
}
```

### typeId 8 — `PhonemeModel`

```dart
@HiveType(typeId: 8)
class PhonemeModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String symbol;       // e.g., "a", "b", "k"
  @HiveField(2) late String name;         // e.g., "Letra Bb"
  @HiveField(3) late int order;           // Marungko Approach sequence order
  @HiveField(4) late String audioUrl;     // Pronunciation audio path
  @HiveField(5) late String imageUrl;     // Illustration path
  @HiveField(6) late String mouthShape;   // Mouth position description
  @HiveField(7) late List<String> exampleWords; // e.g., ["bata", "baso", "bola"]
}
```

---

## Adapter Registration Order

All adapters must be registered in `main.dart` **before** `runApp()` and **before** opening any boxes. Registration order follows typeId sequence:

```dart
void _registerHiveAdapters() {
  Hive.registerAdapter(LearnerModelAdapter());       // typeId: 0
  Hive.registerAdapter(ProgressModelAdapter());      // typeId: 1
  Hive.registerAdapter(StruggleWordModelAdapter());  // typeId: 2
  Hive.registerAdapter(SyncRecordModelAdapter());    // typeId: 3
  Hive.registerAdapter(LessonModelAdapter());        // typeId: 4
  Hive.registerAdapter(DictionaryEntryModelAdapter()); // typeId: 5
  Hive.registerAdapter(AchievementModelAdapter());   // typeId: 6
  Hive.registerAdapter(QuizAttemptModelAdapter());   // typeId: 7
  Hive.registerAdapter(PhonemeModelAdapter());       // typeId: 8
}
```

---

## Encryption Rules

| Box                | Cipher Required | Key Source                          |
| ------------------ | --------------- | ----------------------------------- |
| `learnersBox`      | `HiveAesCipher` | `FlutterSecureStorage` (Rule S5/S6) |
| `progressBox`      | `HiveAesCipher` | `FlutterSecureStorage`              |
| `struggleWordsBox` | `HiveAesCipher` | `FlutterSecureStorage`              |
| `syncQueueBox`     | `HiveAesCipher` | `FlutterSecureStorage`              |
| `lessonsBox`       | None            | —                                   |
| `dictionaryBox`    | None            | —                                   |
| `settingsBox`      | None            | —                                   |

---

## Rules for Adding New TypeAdapters

1. **Request a typeId** from this registry before writing any `@HiveType` annotation
2. **Never reuse** a typeId — even if the old model was deleted
3. **Never change** HiveField indices on existing models — this breaks deserialization
4. **Append-only** field additions: new fields get the next available `@HiveField(n)` index
5. All adapter changes require **ARCHITECT acknowledgment** (Rule R4)
