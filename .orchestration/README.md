# README — BASA AI Orchestration Layer

## What Is This?

This `.orchestration/` directory is the **central command layer** for the **BASA AI** project. It defines how every agent persona, every skill document, and every phase of the project works together to deliver a Flutter-based phonics reading intervention app for Grade 1 and Grade 2 non-readers at Santa Rosa Elementary School, Mulanay, Quezon, Philippines.

If you are new to this project — start here.

---

## Project Summary

| Field                | Detail                                                                                                                 |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **App Name**         | BASA AI                                                                                                                |
| **Platform**         | Flutter (Dart) — Android primary, iOS optional                                                                         |
| **State Management** | Riverpod                                                                                                               |
| **Local Storage**    | Hive (offline-first, encrypted)                                                                                        |
| **Cloud Backend**    | Firebase (Auth + Firestore + Storage)                                                                                  |
| **Target Users**     | Learners (ages 6–8), Teachers, School Administrators                                                                   |
| **Problem Solved**   | High non-reader count identified via Phil-IRI Pre-Test at Santa Rosa Elementary School                                 |
| **Core Approach**    | Phonics-based instruction (Marungko Approach + CVC patterns) + Flutter mobile app + teacher-guided progress monitoring |

### Key Features

- Phonics lessons with Google Speech Recognition for pronunciation feedback
- Mouth shape articulation guide via MediaPipe FaceMesh (on-device, offline)
- QR code storybook scanning via Google ML Kit (on-device, offline)
- Offline-first Hive picture dictionary with audio playback
- Gamified learner progress tracking (XP, levels, mascot "Bibo" the blue owl)
- Secure teacher dashboard with class-level and learner-level reporting
- Hive offline storage synced to Firebase Firestore when online

---

## How This Orchestration Works

BASA AI uses a **multi-agent persona model**. There is no single human assigned to each role — instead, each `.md` file in `agents/` defines a **persona** with a specific mindset, responsibilities, and decision authority. When working on the project, you adopt the relevant persona for the task at hand, or collaborate across personas for cross-cutting decisions.

```
You are building a new feature?         →  Read DEVELOPER.md
You are making an architecture decision? →  Read ARCHITECT.md
You are planning the next sprint?        →  Read PM.md
You are reviewing a PR?                 →  Read REVIEWER.md
You are writing test cases?             →  Read QA.md
You are checking phase milestones?      →  Read PROJECT_PLANNER.md
```

---

## Directory Structure

```
.orchestration/
├── agents/                    # Multi-agent persona definitions
│   ├── ARCHITECT.md           # System design, API contracts, architecture governance
│   ├── DEVELOPER.md           # Flutter implementation standards, structure, DoD
│   ├── PM.md                  # Backlog, sprint planning, risk management
│   ├── PROJECT_PLANNER.md     # Roadmap, phase milestones, dependency mapping
│   ├── QA.md                  # Test plans, UAT protocol, bug severity
│   └── REVIEWER.md            # PR review standards, merge rules, SLAs
│
└── skills/
    ├── README.md              # This file — start here
    ├── ARCHITECTURE.md        # Full system architecture, Hive schema, sync strategy
    ├── RULES.md               # Non-negotiable project rules (all personas enforce these)
    └── TODO.md                # Live task tracker — updated every sprint
```

---

## Agent Persona Quick Reference

| Persona         | Primary Role                           | Go-To For                                             |
| --------------- | -------------------------------------- | ----------------------------------------------------- |
| ARCHITECT       | System design & technical authority    | Architecture questions, API contracts, schema changes |
| DEVELOPER       | Feature implementation in Flutter      | Code, widgets, services, Hive/Firebase integration    |
| PM              | Sprint management & stakeholder bridge | Priorities, timeline, scope changes                   |
| PROJECT_PLANNER | Long-range roadmap & dependencies      | Phase milestones, school calendar alignment           |
| QA              | Quality assurance & testing            | Test cases, bug reports, UAT coordination             |
| REVIEWER        | Code review & merge authority          | PR approvals, Dart/Flutter standards, security review |

---

## Agent Collaboration Flow

```
PROJECT_PLANNER ──(phase gates)──► PM
                                    │
                           ┌────────▼────────┐
                           │   Sprint Cycle  │
                           │                 │
              ARCHITECT ───► DEVELOPER ──────► REVIEWER
                    │              │               │
                    │              ▼               ▼
                    └──────────► QA ──────► PM (sprint report)
```

**Per-feature flow:**

1. PROJECT_PLANNER defines phase → PM creates sprint task
2. ARCHITECT provides spec → DEVELOPER builds (frontend first, then services)
3. DEVELOPER opens PR → REVIEWER reviews
4. REVIEWER approves → QA tests
5. QA signs off → PM marks Done → PROJECT_PLANNER updates milestone

---

## Development Sequencing Principle

> **Frontend first. Services second.**

All Flutter screens and widgets are built with stubbed/mock Riverpod providers before any real Hive or Firebase integration. This keeps UI iteration fast, unblocked, and reviewable by teachers and stakeholders early.

Once the UI is approved → wire in Hive repositories → wire in Firestore sync → wire in APIs.

---

## Core Project Principles

1. **Learner safety first** — Every decision is filtered through "does this protect the child?"
2. **Offline-first always** — If it doesn't work without internet via Hive, it's not done
3. **DepEd alignment** — All content must match the K–12 curriculum (Marungko Approach, CVC)
4. **No merge without review** — REVIEWER approval + QA sign-off required for every feature
5. **Frontend before services** — UI layer complete before service/data layer wiring begins
6. **Document as you build** — ARCHITECTURE, RULES, and TODO stay current at all times

---

## Getting Started (New Session / New Persona)

1. Read **this file** (README.md) completely
2. Read **RULES.md** — memorize the Quick Reference Card
3. Read your **active agent file** (e.g., `agents/DEVELOPER.md`)
4. Read **ARCHITECTURE.md** for the full technical picture
5. Check **TODO.md** for current sprint tasks
6. Check **PROJECT_PLANNER.md** for phase context
7. Ask PM persona if questions about priorities
8. Ask ARCHITECT persona if questions about technical decisions

---

## Project Context

| Detail              | Value                                                                |
| ------------------- | -------------------------------------------------------------------- |
| School Partner      | Santa Rosa Elementary School, Mulanay, Quezon                        |
| Curriculum Standard | DepEd K–12 Basic Education Curriculum                                |
| Phonics Method      | Marungko Approach + CVC Pattern                                      |
| Reading Assessment  | Phil-IRI (Philippine Informal Reading Inventory)                     |
| Target Improvement  | Advance non-readers from frustrated → instructional level in 6 weeks |
