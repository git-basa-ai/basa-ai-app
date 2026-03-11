# RULES — BASA AI

## Purpose

Non-negotiable rules that govern all agent personas, all code, and all decisions in the BASA AI project. When in doubt, these rules take precedence over convenience, speed, or preference.

---

## 1. Learner Safety Rules (Highest Priority)

| #   | Rule                                                                                    |
| --- | --------------------------------------------------------------------------------------- |
| L1  | No external links without a teacher/parent gate screen                                  |
| L2  | No real photos of children in any shared view or dashboard                              |
| L3  | No leaderboard that ranks learners by name publicly                                     |
| L4  | Learner Reference Numbers (LRN) must never appear in logs, analytics, or crash reports  |
| L5  | No countdown timer that locks a learner out of a lesson on expiry                       |
| L6  | Error messages shown to learners must always be encouraging — never "Wrong" or "Failed" |
| L7  | A learner's session data must never be visible to another learner                       |
| L8  | Learner profile images must be avatar-only — no real photos                             |

---

## 2. Data Integrity Rules

| #   | Rule                                                                                              |
| --- | ------------------------------------------------------------------------------------------------- |
| D1  | Learner progress is **always written to Hive first**, then queued in `syncQueueBox` for Firestore |
| D2  | A sync failure must **never result in data loss** — retry with backoff, never discard             |
| D3  | `syncQueueBox` records are deleted **only after** confirmed Firestore write                       |
| D4  | All Firestore documents must include a `lastModified` timestamp on every write                    |
| D5  | No progress or reading score record may be deleted without explicit admin authorization           |
| D6  | Hive boxes must be compacted periodically to prevent fragmentation                                |

---

## 3. Architecture Rules

| #   | Rule                                                                                         |
| --- | -------------------------------------------------------------------------------------------- |
| A1  | Flutter widgets **must never** call Hive or Firestore directly                               |
| A2  | All data access goes through the **Repository → UseCase → Provider** chain                   |
| A3  | The **Domain layer** must contain only pure Dart — no Flutter, Hive, or Firebase imports     |
| A4  | All secrets and API keys must be via `--dart-define` or `.env` — **never in source control** |
| A5  | **GoRouter** is the only navigation pattern — no raw `Navigator.push` in feature code        |
| A6  | Offline features must be tested independently of online features every sprint                |
| A7  | Third-party APIs must be wrapped in service classes — no direct SDK calls from providers     |

---

## 4. Dart / Flutter Code Quality Rules

| #   | Rule                                                                    |
| --- | ----------------------------------------------------------------------- |
| C1  | All UI strings in `l10n/` arb files — no hardcoded text in Dart files   |
| C2  | All colors via `AppColors` — no inline `Color(0xFF...)` values          |
| C3  | All text styles via `AppTypography` — no inline `TextStyle(...)` values |
| C4  | All public classes and methods must have `///` dartdoc comments         |
| C5  | No magic numbers — use named constants in `constants.dart`              |
| C6  | No `print()` statements in production code — use the `logger` package   |
| C7  | No commented-out code blocks in PRs — delete, don't comment out         |
| C8  | `freezed` must be used for all data classes and sealed state types      |
| C9  | No PR reduces existing test coverage                                    |

---

## 5. UI / Child-Friendly Rules

| #   | Rule                                                                                 |
| --- | ------------------------------------------------------------------------------------ |
| U1  | All interactive widgets must have a minimum touch target of **48×48 logical pixels** |
| U2  | No font size below **16sp** anywhere in the app                                      |
| U3  | Color contrast must meet **WCAG AA** (4.5:1 minimum) for all text                    |
| U4  | Mascot **"Bibo"** (blue owl) must appear on every learner-facing screen              |
| U5  | **Bottom NavigationBar** is the only navigation pattern for learner screens          |
| U6  | Colors must come from `AppColors` — no ad-hoc palette additions                      |
| U7  | All loading states show a Lottie animation — never a blank or white screen           |
| U8  | Flutter's `MediaQuery.boldText` and `textScaleFactor` must be respected              |

---

## 6. DepEd Curriculum Rules

| #   | Rule                                                                                     |
| --- | ---------------------------------------------------------------------------------------- |
| E1  | Phonics sequences must follow the **Marungko Approach** order exactly                    |
| E2  | CVC word exercises must use **DepEd-approved word lists** only                           |
| E3  | Pronunciation guidance must use **natural Filipino accent** (not American English)       |
| E4  | All content must be appropriate for **Grade 1 and Grade 2** cognitive levels             |
| E5  | Difficulty progression must be **sequential** — no skipping prerequisite phonemes        |
| E6  | Any content change requires verification against the current DepEd K–12 curriculum guide |

---

## 7. Security Rules

| #   | Rule                                                                                          |
| --- | --------------------------------------------------------------------------------------------- |
| S1  | Firebase security rules enforce role-based access: **Learner < Teacher < Admin**              |
| S2  | A learner may only read and write **their own** Firestore documents                           |
| S3  | Teacher accounts use **email + password Firebase Auth** (not anonymous)                       |
| S4  | Learner accounts use **LRN → Firebase UID binding** managed by teacher/admin                  |
| S5  | Hive boxes containing PII must use **`HiveAesCipher`** encrypted boxes                        |
| S6  | Encryption keys for Hive must be stored in **`FlutterSecureStorage`** — not SharedPreferences |
| S7  | No PII sent to third-party APIs beyond what is strictly necessary for the feature             |
| S8  | School tablets must have **device-level PIN protection**                                      |

---

## 8. Review & Merge Rules

| #   | Rule                                                                                |
| --- | ----------------------------------------------------------------------------------- |
| R1  | **No PR merges to `main` without REVIEWER approval**                                |
| R2  | **No PR merges with open Critical or High severity bugs**                           |
| R3  | Every PR must include a description of what changed and why                         |
| R4  | PRs touching Auth, Hive schema, or SyncService require **ARCHITECT acknowledgment** |
| R5  | QA sign-off is required before any feature is marked Done in the backlog            |
| R6  | Hotfix PRs must still pass REVIEWER review — expedited, never skipped               |

---

## Rule Violation Escalation

```
Developer notices before commit   →  Fix before PR submission
Reviewer catches in PR review     →  Block PR; numbered actionable comments
QA discovers during testing       →  File bug with rule reference (e.g., "violates L6, D1")
Post-merge violation discovered   →  Immediate hotfix + post-mortem with PM
```

---

## Quick Reference Card

```
Before committing:   Check C1–C9
Before opening PR:   Check A1–A7, U1–U8, S1–S8
Before merging:      Check R1–R6
Before any release:  Check L1–L8, D1–D6, E1–E6
```
