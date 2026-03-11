# Flutter Component Diagram — BASA AI

> Authored by: ARCHITECT
> Phase: 2 — System Design
> Status: Finalized

---

## Overview

This document maps every Flutter widget, screen, and shared component in the BASA AI application. It defines the component hierarchy, data flow through Riverpod providers, and the relationship between features and shared widgets.

---

## System Component Architecture

```
┌──────────────────────────────────────────────────────────────────────────┐
│                           MaterialApp.router                            │
│                           (app/app.dart)                                │
│                                                                          │
│  ┌──────────────┐   ┌──────────────────────────────────────────────┐    │
│  │   GoRouter    │   │              AppTheme                        │    │
│  │  (router.dart)│   │  AppColors · AppTypography · ThemeData       │    │
│  └──────┬───────┘   └──────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼                                                                │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                        FEATURE SCREENS                           │    │
│  │                                                                  │    │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐       │    │
│  │  │  Auth  │ │Learner │ │Phonics │ │Speech  │ │FaceMesh│       │    │
│  │  │ Login  │ │  Home  │ │Lessons │ │Record  │ │  Guide │       │    │
│  │  └────────┘ └────────┘ └────────┘ └────────┘ └────────┘       │    │
│  │                                                                  │    │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌─────────┐ ┌────────────┐  │    │
│  │  │Scanner │ │ Dict.  │ │Progress│ │ Teacher │ │  Teacher   │  │    │
│  │  │QR Scan │ │Picture │ │Profile │ │Dashboard│ │  Reports   │  │    │
│  │  └────────┘ └────────┘ └────────┘ └─────────┘ └────────────┘  │    │
│  └──────────────────────────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼ uses                                                           │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                      SHARED WIDGET LIBRARY                       │    │
│  │                                                                  │    │
│  │  BiboMascot · ActivityCard · AnswerTile · XpBar · PhonemeCard   │    │
│  │  OfflineBanner · LoadingOverlay · CelebrationOverlay            │    │
│  └──────────────────────────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼ reads from                                                     │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                     RIVERPOD PROVIDERS                           │    │
│  │                                                                  │    │
│  │  authStateProvider · learnerProvider · lessonProvider            │    │
│  │  progressProvider · quizProvider · dictionaryProvider            │    │
│  │  teacherProvider · networkStateProvider · syncStateProvider      │    │
│  └──────────────────────────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼ calls                                                          │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                     DOMAIN (Use Cases)                           │    │
│  │                                                                  │    │
│  │  LoginUseCase · GetLessonsUseCase · SubmitQuizUseCase           │    │
│  │  RecordSpeechUseCase · CalculateXpUseCase · GetProgressUseCase  │    │
│  │  SyncProgressUseCase · GetClassReportUseCase                    │    │
│  └──────────────────────────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼ via Repository interfaces                                      │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                     DATA (Repositories)                          │    │
│  │                                                                  │    │
│  │  HiveLearnerRepo · HiveProgressRepo · HiveStruggleWordRepo     │    │
│  │  FirestoreLearnerRepo · FirestoreClassRepo                      │    │
│  │  HiveLessonRepo · HiveDictionaryRepo                           │    │
│  └──────────────────────────────────────────────────────────────────┘    │
│         │                                                                │
│         ▼ accesses                                                       │
│  ┌──────────────────────────────────────────────────────────────────┐    │
│  │                     INFRASTRUCTURE                               │    │
│  │                                                                  │    │
│  │  HiveInitializer · FirebaseAuthClient · FirestoreClient         │    │
│  │  SyncService · SpeechService · FaceMeshService · MLKitBarcode   │    │
│  └──────────────────────────────────────────────────────────────────┘    │
└──────────────────────────────────────────────────────────────────────────┘
```

---

## Feature → Shared Widget Mapping

This table shows which shared widgets are used by each feature screen.

| Screen                    | BiboMascot | ActivityCard | AnswerTile | XpBar | PhonemeCard | OfflineBanner | LoadingOverlay | CelebrationOverlay |
| ------------------------- | ---------- | ------------ | ---------- | ----- | ----------- | ------------- | -------------- | ------------------ |
| Login Screen              | ✅         | ❌           | ❌         | ❌    | ❌          | ❌            | ✅             | ❌                 |
| Learner Home Screen       | ✅         | ✅           | ❌         | ✅    | ❌          | ✅            | ✅             | ❌                 |
| Lesson List Screen        | ✅         | ✅           | ❌         | ❌    | ✅          | ✅            | ✅             | ❌                 |
| Lesson Detail Screen      | ✅         | ❌           | ❌         | ❌    | ✅          | ❌            | ✅             | ✅                 |
| Quiz Screen               | ✅         | ❌           | ✅         | ❌    | ❌          | ❌            | ✅             | ✅                 |
| Speech Record Screen      | ✅         | ❌           | ❌         | ❌    | ✅          | ❌            | ✅             | ✅                 |
| Mouth Guide Screen        | ✅         | ❌           | ❌         | ❌    | ❌          | ❌            | ✅             | ❌                 |
| QR Scanner Screen         | ✅         | ❌           | ❌         | ❌    | ❌          | ❌            | ✅             | ✅                 |
| Picture Dictionary Screen | ✅         | ❌           | ❌         | ❌    | ❌          | ✅            | ✅             | ❌                 |
| Progress / Profile Screen | ✅         | ❌           | ❌         | ✅    | ❌          | ❌            | ✅             | ✅                 |
| Teacher Dashboard Screen  | ❌         | ❌           | ❌         | ❌    | ❌          | ✅            | ✅             | ❌                 |
| Teacher Report Screen     | ❌         | ❌           | ❌         | ❌    | ❌          | ✅            | ✅             | ❌                 |
| Learner Management Screen | ❌         | ❌           | ❌         | ❌    | ❌          | ✅            | ✅             | ❌                 |

---

## Shared Widget Specifications

### `BiboMascot`

```
Location: lib/shared/widgets/bibo_mascot.dart
Purpose:  Blue owl mascot with contextual speech bubble (Rule U4)

Props:
  - message: String          → Text displayed in the speech bubble
  - mood: BiboMood           → happy | thinking | encouraging | celebrating
  - size: BiboSize           → small (48dp) | medium (80dp) | large (120dp)
  - onTap: VoidCallback?     → Optional tap handler

Behavior:
  - Enters with slide-up + fade animation (300ms)
  - Speech bubble appears after mascot settles (200ms delay)
  - Lottie animation plays per mood state
  - Respects prefers-reduced-motion
```

### `ActivityCard`

```
Location: lib/shared/widgets/activity_card.dart
Purpose:  Large tappable card for lessons, games, or activities

Props:
  - title: String            → Card heading (text-lg weight 700)
  - description: String      → Short subtitle (text-sm)
  - icon: IconData           → Leading illustration icon
  - progress: double         → 0.0–1.0 progress fill
  - onTap: VoidCallback      → Navigation callback

Behavior:
  - Full-width on mobile
  - Corner radius: 20dp
  - Shadow: subtle blue tint
  - Active/pressed: scale(0.97) spring animation
  - Touch target: entire card surface (≥48dp height)
```

### `AnswerTile`

```
Location: lib/shared/widgets/answer_tile.dart
Purpose:  Answer option for quizzes with correct/wrong feedback states

Props:
  - label: String            → Answer text
  - icon: IconData?          → Optional illustration
  - state: AnswerTileState   → defaultState | selected | correct | wrong
  - onTap: VoidCallback?     → Tap handler (null when disabled)

States:
  - defaultState: White background, border, ready for selection
  - selected: Primary blue border highlight
  - correct: Green border + ✅ badge + celebrate bounce animation
  - wrong: Red border + ❌ + shakeMild animation
  - 800ms feedback delay before state transition

Behavior:
  - Minimum size: 80dp height
  - 2-column grid on mobile, 3-column on tablet
  - Disabled after answer selected (no double-tap)
```

### `XpBar`

```
Location: lib/shared/widgets/xp_bar.dart
Purpose:  Animated XP/progress bar with level indicator

Props:
  - currentXp: int           → Current XP amount
  - maxXp: int               → XP needed for next level
  - level: int               → Current level number
  - showLabel: bool          → Show "Level X" text (default true)

Behavior:
  - Animated fill: 600ms ease-out transition
  - Gold fill color (AppColors.xpGold)
  - Star icon at level indicator
  - Rounded pill shape (radius-full)
```

### `PhonemeCard`

```
Location: lib/shared/widgets/phoneme_card.dart
Purpose:  Display card for a phoneme with audio button and example words

Props:
  - phoneme: String          → Phoneme symbol (e.g., "Bb")
  - name: String             → Display name (e.g., "Letra Bb")
  - exampleWords: List<String> → Example words
  - imageUrl: String?        → Optional illustration
  - onTap: VoidCallback      → Navigate to lesson detail
  - onPlayAudio: VoidCallback? → Play pronunciation audio

Behavior:
  - Card with rounded corners (20dp)
  - Large phoneme letter display (42sp)
  - Audio button with speaker icon (≥48dp touch target)
  - Example words as chips below
```

### `OfflineBanner`

```
Location: lib/shared/widgets/offline_banner.dart
Purpose:  Persistent banner indicating offline state

Props:
  - isOffline: bool          → Show/hide the banner

Behavior:
  - Slides down from top with animation (300ms)
  - Amber/orange background
  - Cloud-off icon + message
  - Auto-dismisses when connectivity returns
```

### `LoadingOverlay`

```
Location: lib/shared/widgets/loading_overlay.dart
Purpose:  Full-screen loading state with Lottie animation (Rule U7)

Props:
  - isLoading: bool          → Show/hide overlay
  - message: String?         → Optional loading message

Behavior:
  - Semi-transparent background overlay
  - Centered Lottie animation (Bibo thinking/loading)
  - Never shows a blank white screen (Rule U7)
  - Fade in/out transition (200ms)
```

### `CelebrationOverlay`

```
Location: lib/shared/widgets/celebration_overlay.dart
Purpose:  Full-screen celebration for correct answers and level-ups

Props:
  - isVisible: bool          → Show/hide overlay
  - message: String          → Celebration text (e.g., "Great job! 🌟")
  - xpEarned: int?           → Optional XP display
  - onDismiss: VoidCallback  → Auto-dismiss callback

Behavior:
  - Confetti particle animation (CSS-style, no heavy packages)
  - Bibo celebrating mood
  - Auto-dismiss after 3 seconds
  - XP earned counter animation (count up)
  - Respects prefers-reduced-motion
```

---

## Riverpod Provider Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                      GLOBAL PROVIDERS                           │
│                                                                 │
│  authStateProvider ──── StreamProvider<AuthState>                │
│  networkStateProvider ── StateProvider<bool>                     │
│  syncStateProvider ──── StateNotifierProvider<SyncState>         │
└───────────┬─────────────────────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────────────────────────┐
│                     FEATURE PROVIDERS                           │
│                                                                 │
│  Auth:     loginProvider, currentUserProvider                   │
│  Learner:  learnerProfileProvider, learnerXpProvider            │
│  Phonics:  lessonListProvider, lessonDetailProvider             │
│  Quiz:     quizStateProvider, quizResultProvider                │
│  Speech:   speechStateProvider, pronunciationResultProvider     │
│  Dict:     dictionaryProvider, wordSearchProvider               │
│  Progress: progressProvider, achievementsProvider               │
│  Teacher:  classListProvider, classStatsProvider, reportProvider │
└─────────────────────────────────────────────────────────────────┘
```

---

## Screen Navigation Flow

```
                    ┌─────────┐
                    │  Login  │
                    └────┬────┘
                         │
              ┌──────────┴──────────┐
              ▼                     ▼
     ┌────────────┐        ┌──────────────┐
     │  Learner   │        │   Teacher    │
     │   Home     │        │  Dashboard   │
     └─────┬──────┘        └──────┬───────┘
           │                      │
    ┌──────┼──────┐        ┌──────┼──────────┐
    ▼      ▼      ▼        ▼      ▼          ▼
 Lessons  Games  Profile  Report  Learner   Class
    │                             Mgmt     Select
    ▼
 Lesson Detail ──► Quiz
    │                │
    ▼                ▼
 Speech Record   Celebration
    │
    ▼
 Mouth Guide

 Standalone (from bottom nav):
 ├── QR Scanner
 ├── Picture Dictionary
 └── Progress / Profile
```

---

## File Structure Summary

```
lib/shared/widgets/
├── bibo_mascot.dart
├── activity_card.dart
├── answer_tile.dart
├── xp_bar.dart
├── phoneme_card.dart
├── offline_banner.dart
├── loading_overlay.dart
└── celebration_overlay.dart
```
