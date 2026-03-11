# TODO — BASA AI Live Task Tracker

> Updated every sprint. Owned by PM persona. All agents check this before starting work.
> **Sequencing rule: Frontend (UI layer) is completed first with mock data. Service integration (Hive, Firestore, APIs) follows in the next sprint.**
> Last Updated: Sprint 1 — Planning Phase

---

## Legend

```
[ ] Not started
[~] In progress
[x] Done
[!] Blocked — see note
```

Priority: 🔴 P0 Critical | 🟡 P1 Important | 🟢 P2 Nice to Have
Layer: 🖼️ Frontend (UI) | ⚙️ Service (Hive / Firebase / API)

---

## PHASE 1 — PLANNING (Current) ✅ / 🔄

### ARCHITECT

- [x] Define Clean Architecture layers (Presentation / Domain / Data / Infrastructure)
- [x] Produce Data Flow Diagram (DFD)
- [x] Produce Network Infrastructure Model
- [x] Lock Hive box schema (box names, TypeAdapter typeIds, encryption flags)
- [x] Lock Firestore collection schema (`/learners`, `/classes`, `/lessons`)
- [ ] Write API integration contracts (Speech, FaceMesh, ML Kit, Firebase Auth)
- [ ] Define Firebase security rules baseline (Learner / Teacher / Admin)

### DEVELOPER

- [x] Initialize Flutter project (`flutter create basa_ai`)
- [x] Set up Firebase project (Auth + Firestore + Storage)
- [x] Set up feature-based folder structure (`features/`, `shared/`, `infrastructure/`)
- [x] Add all pubspec dependencies (Riverpod, Hive, Firebase, GoRouter, Lottie, etc.)
- [x] Set up `AppColors`, `AppTypography`, `AppTheme` in `app/theme/`
- [x] Set up GoRouter with placeholder routes for all screens
- [x] Add Nunito font via `google_fonts`

### PM

- [x] Conduct teacher interviews at Santa Rosa Elementary School
- [x] Collect Phil-IRI Pre-Test baseline data (non-reader counts per grade/section)
- [x] Complete Requirements–Features Matrix
- [x] Complete Use Case Diagram
- [ ] Finalize sprint calendar (6 phases × sprint schedule)
- [ ] Confirm DepEd-approved CVC word list with DepEd coordinator
- [ ] Confirm Marungko Approach phoneme sequence order

### PROJECT_PLANNER

- [x] Map phases to school calendar (Phil-IRI dates, Catch-Up Fridays)
- [ ] Confirm all phase gate milestones with ARCHITECT and PM
- [ ] Create full feature dependency map

### QA

- [ ] Review Requirements–Features Matrix for testability gaps
- [ ] Write test plan shell for Phase 3 (Frontend) features
- [ ] Set up device test matrix (minimum Android API 26 + API 30)
- [ ] Define UAT schedule with school teachers (coordinate with PM)

### REVIEWER

- [ ] Review and approve base Flutter project structure
- [ ] Confirm PR review SLA with team (24hr standard; 2hr for Critical/Security)
- [ ] Review initial Firebase security rules draft

---

## PHASE 2 — SYSTEM DESIGN ✅

### ARCHITECT

- [x] Finalize sync conflict resolution strategy document
- [x] Produce complete Hive TypeAdapter registry (all typeIds assigned)
- [x] Write complete Flutter component diagram (features and shared widgets)

### DEVELOPER 🖼️ Frontend

- [x] Create UI wireframes for all screens (mobile-first, 375dp baseline):
  - Learner Home Screen
  - Phonics Lesson Screen
  - Quiz / Answer Screen
  - Speech Record Screen
  - Mouth Movement Guide Screen
  - QR Scanner Screen
  - Picture Dictionary Screen
  - Progress / XP Screen
  - Teacher Dashboard Screen
  - Learner Management Screen
  - Report Screen
  - Login Screen (Learner + Teacher)
- [ ] Get wireframe approval from school teacher representative
- [x] Design and build shared widget library:
  - `BiboMascot` widget (Lottie + speech bubble)
  - `ActivityCard` widget
  - `AnswerTile` widget (default, correct, wrong states)
  - `XpBar` widget
  - `PhonemeCard` widget
  - `OfflineBanner` widget
  - `LoadingOverlay` widget (Lottie animation)
  - `CelebrationOverlay` widget (confetti + Bibo)

---

## PHASE 3 — FRONTEND DEVELOPMENT (UI-First)

> 🖼️ All screens built with **mock/stubbed Riverpod providers**. No real Hive or Firebase at this stage.

### DEVELOPER 🖼️ Auth Screens

- [ ] Learner LRN login screen (input field, "Enter" button, Bibo welcome)
- [ ] Teacher email/password login screen
- [ ] Role-based route guard (learner → learner home; teacher → dashboard)
- [ ] Logout screen / confirmation dialog
- [ ] Stub: `MockAuthProvider` returning hardcoded role + UID

### DEVELOPER 🖼️ Learner Home Screen

- [ ] Header bar: greeting + level badge + Bibo avatar
- [ ] XP progress bar (animated fill)
- [ ] "Today's Lesson" primary `ActivityCard`
- [ ] 2-column secondary card grid (Games, Word List)
- [ ] Bottom `NavigationBar` (Home | Lessons | Games | Profile)
- [ ] Stub: `MockLearnerProvider` returning hardcoded learner profile + XP

### DEVELOPER 🖼️ Phonics Lesson Screens

- [ ] Lesson list screen (cards per phoneme level, progress per card)
- [ ] Lesson detail screen: phoneme illustration, audio button, "Speak Now" button
- [ ] Mouth movement guide panel (placeholder camera overlay + lip diagram)
- [ ] Lesson completion screen (celebrate animation, XP earned display)
- [ ] Stub: `MockLessonProvider` returning Marungko sequence sample data

### DEVELOPER 🖼️ Quiz / Answer Screens

- [ ] Question card (illustration + question text)
- [ ] 2×2 answer tile grid
- [ ] Correct answer state: green border + ✅ + `celebrate` animation
- [ ] Wrong answer state: red border + ❌ + `shakeMild` animation
- [ ] Score tracker pill in header
- [ ] "Next Question →" button (disabled until answer selected)
- [ ] Stub: `MockQuizProvider` returning sample question set

### DEVELOPER 🖼️ QR Scanner Screen

- [ ] Camera preview with friendly rounded guide border
- [ ] "Scan a Book QR Code" instruction text + Bibo bubble
- [ ] Storybook unlock success state (book cover reveal animation)
- [ ] Invalid QR error state (friendly message: "Hmm, try a different QR code! 🔍")
- [ ] Stub: `MockScannerProvider` simulating successful scan

### DEVELOPER 🖼️ Picture Dictionary Screen

- [ ] 2-column word card grid (illustration + word label)
- [ ] Word card tap state: audio waveform animation placeholder
- [ ] Search/filter bar (letter filter pills: A | B | C ...)
- [ ] Offline indicator badge on screen header
- [ ] Stub: `MockDictionaryProvider` returning sample word list

### DEVELOPER 🖼️ Progress / Profile Screen

- [ ] Level badge + XP bar + "Next level at X XP" label
- [ ] Completed lessons list (checkmark per lesson)
- [ ] Struggle words section (words needing more practice)
- [ ] Achievement badges row (first lesson, first level-up, etc.)
- [ ] Stub: `MockProgressProvider` returning hardcoded progress state

### DEVELOPER 🖼️ Teacher Dashboard Screen

- [ ] Header: "Class Overview" + teacher name + role badge
- [ ] Class selector pill row (Grade 1 Sec A | Grade 1 Sec B)
- [ ] Summary stats card: total learners, on-track, needs help, non-readers
- [ ] Recent activity feed (per-learner lesson completions and struggle flags)
- [ ] "View Full Report" button → report screen
- [ ] Stub: `MockTeacherProvider` returning sample class data

### DEVELOPER 🖼️ Teacher Report Screen

- [ ] Per-learner progress table (name, lessons done, avg score, struggle words)
- [ ] Color-coded status column (🟢 on track | 🟡 needs attention | 🔴 non-reader)
- [ ] "Download Report" button (PDF placeholder)
- [ ] Date range filter
- [ ] Stub: `MockReportProvider`

### QA 🖼️ Frontend Review

- [ ] Verify all touch targets ≥ 48×48dp on each screen (Flutter DevTools)
- [ ] Verify no font below 16sp on any screen
- [ ] Verify Bibo present on all learner screens
- [ ] Verify no RenderFlex overflow on 360dp screen width
- [ ] Verify all animations (`popIn`, `celebrate`, `shakeMild`) play correctly
- [ ] Verify bottom nav is the only nav pattern on learner screens
- [ ] Get school teacher sign-off on UI (UAT Phase 1 — visual-only review)

### REVIEWER 🖼️ Frontend PRs

- [ ] Review all learner screen PRs for child-safe UI rules (U1–U8)
- [ ] Review shared widget library PR
- [ ] Confirm all colors from `AppColors`, all strings from `l10n/`
- [ ] Confirm GoRouter used for all navigation

---

## PHASE 4 — SERVICE INTEGRATION (Backend Wiring)

> ⚙️ Replace all mock providers with real Hive + Firebase + API implementations.

### DEVELOPER ⚙️ Hive Setup

- [ ] Implement `HiveInitializer` — open all boxes with correct cipher setup
- [ ] Implement `FlutterSecureStorage` encryption key generation and retrieval
- [ ] Generate all `@HiveType` TypeAdapters (run `build_runner`)
- [ ] Register all adapters in `main.dart` before `runApp()`
- [ ] Write Hive integration tests (open/read/write/delete per box)
- [ ] Implement Hive box compaction strategy (on app background)

### DEVELOPER ⚙️ Firebase Auth Service

- [ ] Implement LRN → Firebase UID binding logic (teacher creates learner, system signs in anonymously)
- [ ] Implement teacher email/password Firebase Auth flow
- [ ] Implement `AuthRepository` (Firestore + Hive learner profile sync)
- [ ] Implement Riverpod `authStateProvider` (real Firebase stream)
- [ ] Replace `MockAuthProvider` with real `AuthRepository`

### DEVELOPER ⚙️ Firestore Sync Service

- [ ] Implement `SyncService` (reads `syncQueueBox` → Firestore batch writes)
- [ ] Implement connectivity listener (triggers `SyncService` on network restore)
- [ ] Implement `syncQueueBox` write on every Hive progress/progress update
- [ ] Implement retry logic (exponential backoff, max 5 retries per record)
- [ ] Implement Firestore → Hive pull (lessons, dictionary updates on app launch)
- [ ] Replace all mock data providers with real Hive repositories

### DEVELOPER ⚙️ Learner Data Repositories

- [ ] Implement `HiveLearnerRepository` (CRUD for `learnersBox`)
- [ ] Implement `HiveProgressRepository` (CRUD for `progressBox`)
- [ ] Implement `HiveStruggleWordRepository` (CRUD for `struggleWordsBox`)
- [ ] Implement `FirestoreLearnerRepository` (read/write `/learners/{uid}`)
- [ ] Implement `FirestoreClassRepository` (read/write `/classes/{classId}`)
- [ ] Wire all real repositories into Riverpod providers
- [ ] Replace `MockLearnerProvider`, `MockProgressProvider`, `MockTeacherProvider`

### DEVELOPER ⚙️ Speech Recognition Service

- [ ] Implement `SpeechService` wrapping `speech_to_text` package
- [ ] Implement pronunciation evaluator (transcription → phoneme match logic)
- [ ] Handle offline graceful degradation (disable microphone button + Bibo offline message)
- [ ] Store result to Hive `progressBox` before any Firestore sync
- [ ] Wire into `LessonViewModel` / lesson Riverpod provider

### DEVELOPER ⚙️ MediaPipe FaceMesh Service

- [ ] Implement `FaceMeshService` via platform channel or Flutter plugin
- [ ] Map lip landmark coordinates to phoneme shape overlay widget
- [ ] Ensure on-device processing (no network call)
- [ ] Wire into articulation practice screen

### DEVELOPER ⚙️ ML Kit Barcode Service

- [ ] Implement `BarcodeScanService` wrapping `google_mlkit_barcode_scanning`
- [ ] Implement storybook unlock flow (QR payload → story ID → Hive content lookup)
- [ ] Handle invalid QR gracefully (Bibo error bubble)
- [ ] Wire into QR Scanner screen; replace `MockScannerProvider`

### DEVELOPER ⚙️ Picture Dictionary Service

- [ ] Seed `dictionaryBox` with DepEd-approved word list + local audio asset paths
- [ ] Implement audio playback service (`just_audio` or `audioplayers`)
- [ ] Wire into Dictionary screen; replace `MockDictionaryProvider`

### DEVELOPER ⚙️ Progress / XP Service

- [ ] Implement XP calculation logic (points per lesson score, level-up thresholds)
- [ ] Implement level-up trigger → `CelebrationOverlay` display
- [ ] Implement struggle word detection (failCount ≥ 3 → `struggleWordsBox`)
- [ ] Wire into all lesson completion flows

### DEVELOPER ⚙️ Report Generation

- [ ] Implement PDF report generation (`pdf` package)
- [ ] Wire to teacher dashboard "Download Report" button
- [ ] Replace `MockReportProvider` with real Firestore data

### QA ⚙️ Service Testing

- [ ] Full offline test suite (Hive only, no network)
- [ ] Hive sync queue test (offline write → reconnect → verify Firestore)
- [ ] Speech recognition accuracy test (Filipino accent sample set)
- [ ] FaceMesh overlay accuracy test (correct phoneme shape per letter)
- [ ] QR scanner test (valid + invalid QR codes)
- [ ] Firebase security rules test (cross-learner isolation)
- [ ] Encrypted box test (wrong key = box does not open)

### REVIEWER ⚙️ Service PRs

- [ ] Review `HiveInitializer` — confirm encryption on all PII boxes
- [ ] Review `SyncService` — confirm queue-first pattern, retry logic
- [ ] Review `AuthRepository` — confirm LRN never logged, role routing correct
- [ ] Review Firebase security rules PR
- [ ] Review all API wrapper PRs for graceful offline degradation

---

## PHASE 5 — TESTING & VALIDATION

### QA

- [ ] Full regression pass on all P0 features
- [ ] UAT at Santa Rosa Elementary School (teachers + learners)
- [ ] Phil-IRI post-test administered by school teachers
- [ ] Pre/post reading score comparison documented
- [ ] Security audit completed (Firebase rules, Hive encryption, LRN privacy)

---

## PHASE 6 — DEPLOYMENT

### ALL PERSONAS

- [ ] Build release APK / IPA; install on school devices
- [ ] Conduct teacher training workshop
- [ ] Verify Firebase monitoring dashboard live
- [ ] Test backup/recovery procedure end-to-end
- [ ] Submit final documentation to DepEd coordinator
- [ ] Complete and submit research paper findings

---

## 🐛 Open Bugs

| Bug ID | Severity | Description                          | Status |
| ------ | -------- | ------------------------------------ | ------ |
| —      | —        | None yet — project in Planning Phase | —      |

---

## 📝 Decisions Log

| Date     | Decision                                       | Persona   | Rationale                                                |
| -------- | ---------------------------------------------- | --------- | -------------------------------------------------------- |
| Sprint 1 | Flutter (not Android-only Java)                | ARCHITECT | Cross-platform, single codebase, richer UI system        |
| Sprint 1 | Hive (not SQLite/Room)                         | ARCHITECT | Flutter-native, faster, encrypted boxes, no ORM overhead |
| Sprint 1 | Riverpod (not BLoC)                            | ARCHITECT | Compile-safe, testable, no BuildContext dependency       |
| Sprint 1 | GoRouter (not Navigator 1.0)                   | ARCHITECT | Declarative routing, deep link support, type-safe        |
| Sprint 1 | Frontend-first sequencing                      | PM        | Unblocks UI iteration; teacher can review screens early  |
| Sprint 1 | Marungko Approach as primary phonics method    | PM        | DepEd-aligned; proven for Filipino early readers         |
| Sprint 1 | Filipino accent for all speech models          | ARCHITECT | Cultural appropriateness; ELSA Speak gap identified      |
| Sprint 1 | `FlutterSecureStorage` for Hive encryption key | ARCHITECT | More secure than SharedPreferences for key material      |
