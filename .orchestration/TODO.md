# TODO — BASA AI Live Task Tracker

> Updated every sprint. Owned by PM persona. All agents check this before starting work.
> **Sequencing rule: Frontend (UI layer) is completed first with mock data. Service integration (Hive, Firestore, APIs) follows in the next sprint.**
> Last Updated: Sprint 2 — Frontend Development

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

## PHASE 1 — PLANNING ✅ / 🔄

### ARCHITECT

- [x] Define Clean Architecture layers (Presentation / Domain / Data / Infrastructure)
- [x] Produce Data Flow Diagram (DFD)
- [x] Produce Network Infrastructure Model
- [x] Lock Hive box schema (box names, TypeAdapter typeIds, encryption flags)
- [x] Lock Firestore collection schema (`/learners`, `/classes`, `/lessons`)
- [ ] Write API integration contracts (Speech, FaceMesh, ML Kit, Firebase Auth)
- [ ] Define Firebase security rules baseline (Learner / Teacher / Coordinator)

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
  - **Learner Screens (original set)**
  - Learner Home Screen
  - Phonics Lesson Screen
  - Quiz / Answer Screen
  - Speech Record Screen
  - Mouth Movement Guide Screen
  - QR Scanner Screen
  - Picture Dictionary Screen
  - Progress / XP Screen
  - **Teacher Screens (original set)**
  - Teacher Dashboard Screen
  - Learner Management Screen
  - Report Screen
  - Login Screen (Learner + Teacher)
  - **New screens to wireframe**
  - Role Selection Screen (Learner | Teacher | Coordinator)
  - Help & Guide Menu (6 categories)
  - Leaderboard Screen
  - App Settings Screen
  - Learner Settings Screen (volume, language, music, visual filters)
  - Coordinator Login Screen
  - Manage User Access Screen (add / edit / delete learners by LRN)
  - Track Learner Progress Screen (per-learner detail)
  - Difficult / Mastered Words Screen
  - Teacher Feedback Screen
  - Coordinator Dashboard Screen
  - Program Analytics Screen
  - Supervise Teachers Screen
  - Coordinator Report Screen
- [ ] Get wireframe approval from school teacher representative and DepEd coordinator
- [x] Design and build shared widget library (original set):
  - `BiboMascot` widget (Lottie + speech bubble)
  - `ActivityCard` widget
  - `AnswerTile` widget (default, correct, wrong states)
  - `XpBar` widget
  - `PhonemeCard` widget
  - `OfflineBanner` widget
  - `LoadingOverlay` widget (Lottie animation)
  - `CelebrationOverlay` widget (confetti + Bibo)
- [ ] Add new shared widgets to library:
  - `RoleButton` widget (role selection card with icon)
  - `LearnerListTile` widget (name, LRN, status badge)
  - `StatSummaryCard` widget (number + label + color, reused across dashboards)
  - `WordStatusChip` widget (mastered 🟢 | struggling 🔴)

---

## PHASE 3 — FRONTEND DEVELOPMENT (UI-First) 🔄

> 🖼️ All screens built with **mock/stubbed Riverpod providers**. No real Hive or Firebase at this stage.
> Three user roles: **Learner**, **Teacher**, **Coordinator** — each has its own screen set.

---

### DEVELOPER 🖼️ Entry & Shared Screens

- [ ] **Role Selection Screen** — "BASA AI" logo, three role buttons (Learner | Teacher | Coordinator), utility icons (Help, Leaderboard, Settings)
- [ ] **Help & Guide Menu** — dark header, scrollable card list of 6 categories (Sound Detection, Storytelling, QR Stories, Mouth Detection, Picture Dictionary, General Tips) with icons and arrows, Close button
- [ ] **Leaderboard Screen** — top learners ranked by XP, class filter pill row, avatar + name + score rows; no real names — avatar only (Rule L3)
- [ ] **App Settings Screen** — volume slider, language toggle (English | Filipino), background music on/off, visual filter toggle (high contrast); accessible from all roles
- [ ] Stub: `MockSettingsProvider` returning hardcoded defaults

---

### DEVELOPER 🖼️ Auth Screens

- [x] Learner LRN login screen (input field, "Enter" button, Bibo welcome)
- [x] Teacher email/password login screen
- [x] Role-based route guard (learner → learner home; teacher → dashboard)
- [ ] **Coordinator login screen** — email + password, "Coordinator" role badge in header
- [ ] Logout screen / confirmation dialog
- [x] Stub: `MockAuthProvider` returning hardcoded role + UID

---

### DEVELOPER 🖼️ Learner Screens

#### Home

- [x] Header bar: greeting + level badge + Bibo avatar
- [x] Animated XP progress bar (animated fill)
- [x] "Today's Lesson" primary `ActivityCard`
- [x] 2-column secondary card grid (Games | Word List)
- [x] Bottom `NavigationBar` (Home | Lessons | Games | Profile)
- [x] Stub: `MockLearnerProvider` returning hardcoded learner profile + XP

#### Phonics Lesson Screens

- [x] Lesson list screen (cards per phoneme level, progress per card)
- [x] Lesson detail screen: phoneme illustration, audio button, "Speak Now" button
- [x] Mouth movement guide panel (placeholder camera overlay + lip diagram)
- [x] Lesson completion screen (celebrate animation, XP earned display)
- [x] Stub: `MockLessonProvider` returning Marungko sequence sample data

#### Quiz / Answer Screens

- [x] Question card (illustration + question text)
- [x] 2×2 answer tile grid
- [x] Correct answer state: green border + ✅ + `celebrate` animation
- [x] Wrong answer state: red border + ❌ + `shakeMild` animation
- [x] Score tracker pill in header
- [x] "Next Question →" button (disabled until answer selected)
- [x] Stub: `MockQuizProvider` returning sample question set

#### QR Scanner Screen

- [x] Camera preview with friendly rounded guide border
- [x] "Scan a Book QR Code" instruction text + Bibo bubble
- [x] Storybook unlock success state (book cover reveal animation)
- [x] Invalid QR error state (friendly message: "Hmm, try a different QR code! 🔍")
- [x] Stub: `MockScannerProvider` simulating successful scan

#### Picture Dictionary Screen

- [x] 2-column word card grid (illustration + word label)
- [x] Word card tap state: audio waveform animation placeholder
- [x] Search/filter bar (letter filter pills: A | B | C ...)
- [x] Offline indicator badge on screen header
- [x] Stub: `MockDictionaryProvider` returning sample word list

#### Learner Progress / Profile Screen

- [x] Level badge + XP bar + "Next level at X XP" label
- [x] Completed lessons list (checkmark per lesson)
- [x] Struggle words section (words needing more practice)
- [x] Achievement badges row (first lesson, first level-up, etc.)
- [x] Stub: `MockProgressProvider` returning hardcoded progress state

#### Learner Settings Screen _(new — not yet built)_

- [ ] Volume slider (sound effects + voice playback)
- [ ] Language toggle: English | Filipino (switches lesson language)
- [ ] Background music on/off toggle
- [ ] Visual filter toggle (high contrast mode for accessibility)
- [ ] "Back to Home" button
- [ ] Stub: `MockSettingsProvider`

---

### DEVELOPER 🖼️ Teacher Screens

#### Teacher Dashboard Screen

- [x] Header: "Class Overview" + teacher name + role badge
- [x] Class selector pill row (Grade 1 Sec A | Grade 1 Sec B)
- [x] Summary stats card: total learners, on-track, needs help, non-readers
- [x] Recent activity feed (per-learner lesson completions and struggle flags)
- [x] "View Full Report" button → report screen
- [x] Stub: `MockTeacherProvider` returning sample class data
- [ ] Quick-action buttons: "Manage Learners" | "View Progress" | "Generate Report"

#### Manage User Access Screen _(new — not yet built)_

- [ ] Learner list — `LearnerListTile` per row (name, LRN, section, status badge)
- [ ] "Add Learner" FAB → Add Learner bottom sheet (LRN input + name + grade + section)
- [ ] Swipe-to-delete learner with confirmation dialog ("Remove [Name] from your class?")
- [ ] Edit learner bottom sheet (edit name, section, permissions)
- [ ] Empty state: "No learners yet. Tap + to add your first learner."
- [ ] Stub: `MockUserManagementProvider`

#### Track Learner Progress Screen _(new — not yet built)_

- [ ] Learner header card: name, LRN, grade/section, reading level badge
- [ ] Lessons completed progress bar (e.g. "8 / 20 lessons")
- [ ] Average score display + trend arrow (improving / declining)
- [ ] Activity log list: date | lesson | score | duration rows
- [ ] "View Difficult Words" link → Difficult/Mastered Words Screen
- [ ] "Add Feedback Note" button → Teacher Feedback Screen
- [ ] Stub: `MockLearnerProgressProvider`

#### Difficult / Mastered Words Screen _(new — not yet built)_

- [ ] Two-tab layout: "Struggling 🔴" | "Mastered 🟢"
- [ ] `WordStatusChip` grid per tab (word + fail count or mastery date)
- [ ] Filter by date range
- [ ] Empty states: "No struggling words — great job! 🎉" / "No mastered words yet"
- [ ] Stub: `MockWordTrackingProvider`

#### Teacher Feedback Screen _(new — not yet built)_

- [ ] Learner name + avatar in header
- [ ] Existing feedback notes list (date + note text per row)
- [ ] "Add Note" text field + "Save" button
- [ ] Character limit indicator (max 300 characters)
- [ ] Stub: `MockFeedbackProvider`

#### Teacher Report Screen

- [x] Per-learner progress table (name, lessons done, avg score, struggle words)
- [x] Color-coded status column (🟢 on track | 🟡 needs attention | 🔴 non-reader)
- [x] "Download Report" button (PDF placeholder)
- [x] Date range filter
- [x] Stub: `MockReportProvider`
- [ ] Class filter (by section)
- [ ] "Print Report" button → system print dialog placeholder

---

### DEVELOPER 🖼️ Coordinator Screens _(new — not yet built)_

#### Coordinator Dashboard Screen

- [ ] Header: "Program Overview" + coordinator name + "Coordinator" role badge
- [ ] School-wide `StatSummaryCard` row: Total Learners | Total Teachers | Classes | Avg Score
- [ ] Teachers list — card per teacher (name, class count, learner count, last active)
- [ ] Program health indicator: % of learners on-track school-wide
- [ ] "View All Analytics" button → Program Analytics Screen
- [ ] Stub: `MockCoordinatorProvider` returning sample school-wide data

#### Program Analytics Screen

- [ ] Reading level distribution chart (Non-reader | Frustration | Instructional | Independent)
- [ ] Trend line: avg score over time (week-by-week)
- [ ] Top struggling words school-wide (word + count bar chart)
- [ ] Section comparison table (class | avg score | % on-track)
- [ ] Date range selector
- [ ] Stub: `MockAnalyticsProvider`

#### Supervise Teachers Screen

- [ ] Teacher list — `LearnerListTile`-style rows (teacher name, class, learner count, last login)
- [ ] Tap teacher → Teacher Detail View (their class stats, recent activity, learner count by status)
- [ ] Filter teachers by grade level
- [ ] Empty state: "No teachers registered yet"
- [ ] Stub: `MockTeacherSupervisionProvider`

#### Coordinator Report Screen

- [ ] School-wide report: all classes, all teachers, all learners in one view
- [ ] Section breakdown table
- [ ] Phil-IRI pre/post comparison section (pre-test | post-test | delta per learner)
- [ ] "Export Full Report" button → PDF placeholder
- [ ] "Export CSV" button → CSV placeholder
- [ ] Stub: `MockCoordinatorReportProvider`

---

### QA 🖼️ Frontend Review

- [ ] Verify all touch targets ≥ 48×48dp on every screen (Flutter DevTools layout inspector)
- [ ] Verify no font below 16sp anywhere; headings ≥ 24sp
- [ ] Verify Bibo mascot present on all learner-facing screens
- [ ] Verify no `RenderFlex` overflow on 360dp screen width (budget Android)
- [ ] Verify all animations (`popIn`, `celebrate`, `shakeMild`) play correctly
- [ ] Verify bottom `NavigationBar` is the only nav pattern on learner screens
- [ ] Verify coordinator screens use standard `AppBar` + back navigation (not bottom nav)
- [ ] Verify teacher screens use standard `AppBar` + drawer or back navigation
- [ ] Verify role selection screen routes correctly to each role's login
- [ ] Verify learner settings screen — all 4 toggles/sliders render and respond to tap
- [ ] Verify Help & Guide menu — all 6 categories display correctly
- [ ] Get school teacher sign-off on Teacher + Learner UI (UAT Phase 1 — visual-only)
- [ ] Get DepEd coordinator sign-off on Coordinator UI

### REVIEWER 🖼️ Frontend PRs

- [ ] Review all learner screen PRs for child-safe UI rules (U1–U8)
- [ ] Review all teacher screen PRs — confirm no learner PII exposed in list views
- [ ] Review coordinator screen PRs — confirm role-gating is in GoRouter guards
- [ ] Review shared widget library PR
- [ ] Confirm all colors from `AppColors`, all strings from `l10n/`
- [ ] Confirm GoRouter used for all navigation; no raw `Navigator.push`
- [ ] Confirm no Hive or Firebase imports in any screen or widget file

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
- [ ] Implement coordinator email/password Firebase Auth flow + role claim verification
- [ ] Implement `AuthRepository` (Firestore + Hive learner profile sync)
- [ ] Implement Riverpod `authStateProvider` (real Firebase stream)
- [ ] Replace `MockAuthProvider` with real `AuthRepository`

### DEVELOPER ⚙️ Firestore Sync Service

- [ ] Implement `SyncService` (reads `syncQueueBox` → Firestore batch writes)
- [ ] Implement connectivity listener (triggers `SyncService` on network restore)
- [ ] Implement `syncQueueBox` write on every Hive progress update
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
- [ ] Implement mastered word detection (score ≥ threshold on 3 consecutive attempts → mastered)
- [ ] Wire into all lesson completion flows

### DEVELOPER ⚙️ Report Generation

- [ ] Implement PDF report generation (`pdf` package) for teacher report
- [ ] Implement CSV export for coordinator report
- [ ] Implement school-wide comprehensive PDF for coordinator
- [ ] Wire "Download Report" and "Print Report" buttons to real data
- [ ] Replace `MockReportProvider` and `MockCoordinatorReportProvider` with real Firestore data

### DEVELOPER ⚙️ Coordinator Data Repositories

- [ ] Implement `FirestoreCoordinatorRepository` (read all `/classes`, `/learners`, `/schools`)
- [ ] Implement program analytics aggregation (reading level distribution, trend data, struggle words)
- [ ] Implement teacher supervision data (teacher list, their class stats, last login)
- [ ] Wire into Riverpod coordinator providers
- [ ] Replace `MockCoordinatorProvider`, `MockAnalyticsProvider`, `MockTeacherSupervisionProvider`

### DEVELOPER ⚙️ Teacher Feedback & Word Tracking Service

- [ ] Implement `FirestoreFeedbackRepository` (teacher notes stored under `/learners/{uid}/feedback/`)
- [ ] Wire difficult/mastered word logic into lesson completion flow
- [ ] Replace `MockFeedbackProvider` and `MockWordTrackingProvider`

### DEVELOPER ⚙️ App Settings Service

- [ ] Implement `SettingsRepository` backed by `settingsBox` (Hive, unencrypted)
- [ ] Implement language toggle — switch `l10n` locale at runtime
- [ ] Implement volume controller (affects `just_audio` + sound effects player)
- [ ] Implement visual filter (high contrast `ThemeData` variant)
- [ ] Wire into `MockSettingsProvider` replacement across all roles

### QA ⚙️ Service Testing

- [ ] Full offline test suite (Hive only, no network) — all learner features
- [ ] Hive sync queue test (offline write → reconnect → verify Firestore)
- [ ] Speech recognition accuracy test (Filipino accent sample set)
- [ ] FaceMesh overlay accuracy test (correct phoneme shape per letter)
- [ ] QR scanner test (valid + invalid QR codes)
- [ ] Firebase security rules test (cross-learner isolation, teacher cannot read other teacher's class)
- [ ] Coordinator cannot write to `/learners` documents directly (read-only analytics)
- [ ] Encrypted box test (wrong key = box does not open)
- [ ] Settings persistence test (language + volume survive app restart via Hive `settingsBox`)
- [ ] Language toggle test (all UI strings switch correctly between English and Filipino)
- [ ] Teacher feedback test — note saved to Firestore, visible on next load
- [ ] Mastered word detection test — 3× passing score triggers mastered state correctly
- [ ] Coordinator report test — school-wide data aggregates correctly across all classes

### REVIEWER ⚙️ Service PRs

- [ ] Review `HiveInitializer` — confirm encryption on all PII boxes
- [ ] Review `SyncService` — confirm queue-first pattern, retry logic
- [ ] Review `AuthRepository` — confirm LRN never logged, role routing correct for all 3 roles
- [ ] Review `FirestoreCoordinatorRepository` — confirm read-only access pattern, no learner writes
- [ ] Review Firebase security rules PR — all three roles (Learner / Teacher / Coordinator)
- [ ] Review `SettingsRepository` — confirm no PII in `settingsBox`, language switch safe
- [ ] Review all API wrapper PRs for graceful offline degradation

---

## PHASE 5 — TESTING & VALIDATION

### QA

- [ ] Full regression pass on all P0 features
- [ ] UAT at Santa Rosa Elementary School (teachers + learners + coordinator)
- [ ] Phil-IRI post-test administered by school teachers
- [ ] Pre/post reading score comparison documented
- [ ] Security audit completed (Firebase rules, Hive encryption, LRN privacy)

---

## PHASE 6 — DEPLOYMENT

### ALL PERSONAS

- [ ] Build release APK / IPA; install on school devices
- [ ] Conduct teacher training workshop
- [ ] Conduct coordinator orientation on program analytics
- [ ] Verify Firebase monitoring dashboard live
- [ ] Test backup/recovery procedure end-to-end
- [ ] Submit final documentation to DepEd coordinator
- [ ] Complete and submit research paper findings

---

## 🐛 Open Bugs

| Bug ID | Severity | Description                   | Status |
| ------ | -------- | ----------------------------- | ------ |
| —      | —        | None yet — active development | —      |

---

## 📝 Decisions Log

| Date     | Decision                                                    | Persona   | Rationale                                                               |
| -------- | ----------------------------------------------------------- | --------- | ----------------------------------------------------------------------- |
| Sprint 1 | Flutter (not Android-only Java)                             | ARCHITECT | Cross-platform, single codebase, richer UI system                       |
| Sprint 1 | Hive (not SQLite/Room)                                      | ARCHITECT | Flutter-native, faster, encrypted boxes, no ORM overhead                |
| Sprint 1 | Riverpod (not BLoC)                                         | ARCHITECT | Compile-safe, testable, no BuildContext dependency                      |
| Sprint 1 | GoRouter (not Navigator 1.0)                                | ARCHITECT | Declarative routing, deep link support, type-safe                       |
| Sprint 1 | Frontend-first sequencing                                   | PM        | Unblocks UI iteration; teacher/coordinator can review screens early     |
| Sprint 1 | Marungko Approach as primary phonics method                 | PM        | DepEd-aligned; proven for Filipino early readers                        |
| Sprint 1 | Filipino accent for all speech models                       | ARCHITECT | Cultural appropriateness; ELSA Speak gap identified                     |
| Sprint 1 | `FlutterSecureStorage` for Hive encryption key              | ARCHITECT | More secure than SharedPreferences for key material                     |
| Sprint 2 | Three user roles: Learner / Teacher / Coordinator           | ARCHITECT | Matches Use Case Diagram; Coordinator is analytics role above Teacher   |
| Sprint 2 | Coordinator is read-only on Firestore                       | ARCHITECT | Coordinators monitor program trends; they do not manage learner records |
| Sprint 2 | Learner settings stored in Hive `settingsBox` (unencrypted) | ARCHITECT | No PII in settings; volume/language/theme are non-sensitive preferences |
