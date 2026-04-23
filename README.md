# BASA AI

Offline-first Flutter application for early-grade reading intervention, designed for learners, teachers, and school administrators.

## Overview

BASA AI is a mobile learning app that combines phonics-based reading activities with teacher-facing monitoring tools. The project uses a layered architecture with local-first data handling and cloud synchronization.

Core stack:

- Flutter + Dart
- Riverpod for state management
- GoRouter for navigation
- Hive for local offline storage
- Firebase (Auth, Firestore, Storage) for cloud services
- Speech and on-device ML integrations for assisted learning features

## Prerequisites

Install these tools before running the project:

1. Flutter SDK (compatible with Dart SDK in this project)
2. Android Studio or VS Code with Flutter and Dart extensions
3. Android SDK (for Android builds)
4. Xcode (macOS only, for iOS builds)
5. Firebase project configuration (for cloud-backed features)

## Version Requirements (From This Codebase)

These values are based on current project configuration files.

1. Dart SDK: >=3.3.4 <4.0.0
   - Source: pubspec.yaml environment sdk constraint

2. Flutter SDK: use a Flutter release that includes Dart 3.3.4 or newer
   - Recommended baseline: Flutter 3.22.0 or newer
   - Reason: the project does not pin a flutter: version in pubspec, but it requires Dart >=3.3.4

3. Android SDK:
   - Minimum Android API for app install: minSdkVersion 21
   - Compile/target SDK: inherited from Flutter Gradle plugin (flutter.compileSdkVersion and flutter.targetSdkVersion)
   - Recommended setup in Android Studio: install Android SDK Platform 34 or newer to match current Flutter defaults

4. Gradle Wrapper:
   - Gradle 8.4
   - Source: android/gradle/wrapper/gradle-wrapper.properties

## Install Dependencies

From the project root, run:

```bash
flutter pub get
```

This installs all dependencies declared in pubspec.yaml, including:

- flutter_riverpod, go_router
- hive, hive_flutter, flutter_secure_storage
- firebase_core, firebase_auth, cloud_firestore, firebase_storage
- speech_to_text, google_mlkit_barcode_scanning

## Generate Code (Required for This Project)

This codebase uses generated files for packages like freezed, json_serializable, riverpod_generator, and hive_generator.

Run this after flutter pub get and whenever annotated models/providers change:

```bash
dart run build_runner build --delete-conflicting-outputs
```

For active development, you can use watch mode:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Run the App

1. Verify your setup:

```bash
flutter doctor
```

2. List available devices:

```bash
flutter devices
```

3. Run on a selected device:

```bash
flutter run
```

Useful alternatives:

```bash
flutter run -d chrome
flutter run -d android
flutter run -d ios
```

## Common Development Commands

```bash
flutter analyze
flutter test
flutter pub outdated
```

## Codebase Structure

High-level structure:

```text
lib/
	app/              # App bootstrap, routing, app-level composition
	features/         # Feature modules (learner, teacher, progress, etc.)
	infrastructure/   # Data layer integrations (Hive, Firebase, services)
	l10n/             # Localization resources
	shared/           # Shared UI, utilities, constants, and helpers
main.dart           # Application entry point
```

Other important folders:

- assets/images for static assets
- test for automated tests
- android, ios, web, linux, macos, windows for platform runners

## How to Use the .github Folder

The .github directory in this project is not only for CI metadata. It is the project operating guide for architecture, implementation standards, and role-based workflows.

Structure:

```text
.github/
	agents/   # Role-specific agent personas and responsibilities
	docs/     # Architecture, rules, diagrams, TODO and governance docs
	prompts/  # Reusable prompt templates (for example, commit workflow)
	skills/   # Domain-specific implementation guidance
```

Recommended onboarding flow:

1. Read .github/docs/readme.md first
2. Read .github/docs/rules.md for non-negotiable standards
3. Review .github/docs/architecture.md for system-level decisions
4. Check .github/docs/todo.md for current priorities
5. Use .github/agents/\*.agent.md based on your role:
   - architect.agent.md for system design decisions
   - developer.agent.md for feature implementation
   - reviewer.agent.md for code review and merge quality
   - qa.agent.md for validation and test scope
   - pm.agent.md and project-planner.agent.md for planning and milestones
6. Use .github/skills/backend-design/SKILL.md and .github/skills/frontend-design/SKILL.md when working on those domains

## Suggested Development Workflow

1. Pull latest changes from main branch
2. Run flutter pub get
3. Run code generation with build_runner
4. Implement feature in lib/features and supporting layers
5. Run flutter analyze and flutter test
6. Update relevant docs in .github/docs when architecture or rules are impacted
7. Open PR with clear change summary and validation notes

## Notes

- Keep API keys and secrets out of source control
- Prefer configuration via environment values and runtime configuration
- Validate offline behavior for data-sensitive features before merge

## Flutter Learning Resources

- https://docs.flutter.dev/
- https://docs.flutter.dev/get-started/codelab
- https://docs.flutter.dev/cookbook
