import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/app_settings_screen.dart';
import '../features/auth/presentation/screens/coordinator_login_screen.dart';
import '../features/auth/presentation/screens/help_guide_screen.dart';
import '../features/auth/presentation/screens/leaderboard_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/role_selection_screen.dart';
import '../features/coordinator/presentation/screens/coordinator_dashboard_screen.dart';
import '../features/coordinator/presentation/screens/coordinator_profile_screen.dart';
import '../features/coordinator/presentation/screens/coordinator_report_screen.dart';
import '../features/coordinator/presentation/screens/program_analytics_screen.dart';
import '../features/coordinator/presentation/screens/supervise_teachers_screen.dart';
import '../features/dictionary/presentation/screens/dictionary_screen.dart';
import '../features/face_mesh/presentation/screens/mouth_guide_screen.dart';
import '../features/games/presentation/screens/games_hub_screen.dart';
import '../features/learner/presentation/screens/learner_home_screen.dart';
import '../features/learner/presentation/screens/learner_settings_screen.dart';
import '../features/phonics/presentation/screens/lesson_detail_screen.dart';
import '../features/phonics/presentation/screens/lesson_list_screen.dart';
import '../features/phonics/presentation/screens/quiz_screen.dart';
import '../features/progress/presentation/screens/progress_screen.dart';
import '../features/scanner/presentation/screens/qr_scanner_screen.dart';
import '../features/speech/presentation/screens/speech_record_screen.dart';
import '../features/teacher/presentation/screens/feedback_screen.dart';
import '../features/teacher/presentation/screens/learner_management_screen.dart';
import '../features/teacher/presentation/screens/manage_users_screen.dart';
import '../features/teacher/presentation/screens/teacher_dashboard_screen.dart';
import '../features/teacher/presentation/screens/teacher_profile_screen.dart';
import '../features/teacher/presentation/screens/teacher_report_screen.dart';
import '../features/teacher/presentation/screens/track_progress_screen.dart';
import '../features/teacher/presentation/screens/words_screen.dart';
import '../shared/presentation/coordinator_shell.dart';
import '../shared/presentation/learner_shell.dart';
import '../shared/presentation/teacher_shell.dart';

/// Navigator keys for the shell route branches.
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _learnerShellKey = GlobalKey<NavigatorState>();
final _teacherShellKey = GlobalKey<NavigatorState>();
final _coordinatorShellKey = GlobalKey<NavigatorState>();

/// Central GoRouter configuration for BASA AI.
///
/// Rule A5: GoRouter is the only navigation pattern — no raw `Navigator.push`.
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/role-selection',
  routes: [
    // ── Entry & Shared ─────────────────────────────────────────
    GoRoute(
      path: '/role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/help',
      builder: (context, state) => const HelpGuideScreen(),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (context, state) => const LeaderboardScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const AppSettingsScreen(),
    ),

    // ── Auth ───────────────────────────────────────────────────
    GoRoute(
      path: '/login/:role',
      builder: (context, state) => LoginScreen(
        role: state.pathParameters['role'] ?? 'learner',
      ),
    ),
    GoRoute(
      path: '/coordinator-login',
      builder: (context, state) => const CoordinatorLoginScreen(),
    ),

    // ── Learner Screens (wrapped in bottom nav shell — Rule U5) ─
    ShellRoute(
      navigatorKey: _learnerShellKey,
      builder: (context, state, child) {
        final location = state.uri.toString();
        int index = 0;
        if (location.startsWith('/learner/lessons') ||
            location.startsWith('/learner/lesson/')) {
          index = 1;
        } else if (location.startsWith('/learner/scanner')) {
          index = 2;
        } else if (location.startsWith('/learner/games') ||
            location.startsWith('/learner/quiz') ||
            location.startsWith('/learner/dictionary')) {
          index = 3;
        } else if (location.startsWith('/learner/progress')) {
          index = 4;
        }

        return LearnerShell(
          currentIndex: index,
          onDestinationSelected: (i) {
            switch (i) {
              case 0:
                context.go('/learner');
              case 1:
                context.go('/learner/lessons');
              case 2:
                context.go('/learner/scanner');
              case 3:
                context.go('/learner/games');
              case 4:
                context.go('/learner/progress');
            }
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/learner',
          builder: (context, state) => const LearnerHomeScreen(),
        ),
        GoRoute(
          path: '/learner/lessons',
          builder: (context, state) => const LessonListScreen(),
        ),
        GoRoute(
          path: '/learner/lesson/:id',
          builder: (context, state) => LessonDetailScreen(
            lessonId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: '/learner/quiz/:id',
          builder: (context, state) => QuizScreen(
            lessonId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: '/learner/speech',
          builder: (context, state) => SpeechRecordScreen(
            phoneme: state.uri.queryParameters['phoneme'] ?? 'Aa',
          ),
        ),
        GoRoute(
          path: '/learner/mouth-guide',
          builder: (context, state) => MouthGuideScreen(
            phoneme: state.uri.queryParameters['phoneme'] ?? 'Aa',
          ),
        ),
        GoRoute(
          path: '/learner/scanner',
          builder: (context, state) => const QrScannerScreen(),
        ),
        GoRoute(
          path: '/learner/games',
          builder: (context, state) => const GamesHubScreen(),
        ),
        GoRoute(
          path: '/learner/dictionary',
          builder: (context, state) => const DictionaryScreen(),
        ),
        GoRoute(
          path: '/learner/progress',
          builder: (context, state) => const ProgressScreen(),
        ),
        GoRoute(
          path: '/learner/settings',
          builder: (context, state) => const LearnerSettingsScreen(),
        ),
      ],
    ),

    // ── Teacher Screens (wrapped in bottom nav shell) ────────────
    ShellRoute(
      navigatorKey: _teacherShellKey,
      builder: (context, state, child) {
        final location = state.uri.toString();
        int index = 0;
        if (location.startsWith('/teacher/manage') ||
            location.startsWith('/teacher/learners') ||
            location.startsWith('/teacher/track-progress') ||
            location.startsWith('/teacher/words') ||
            location.startsWith('/teacher/feedback')) {
          index = 1;
        } else if (location.startsWith('/teacher/report')) {
          index = 2;
        } else if (location.startsWith('/teacher/profile')) {
          index = 3;
        }

        return TeacherShell(
          currentIndex: index,
          onDestinationSelected: (i) {
            switch (i) {
              case 0:
                context.go('/teacher');
              case 1:
                context.go('/teacher/manage');
              case 2:
                context.go('/teacher/report');
              case 3:
                context.go('/teacher/profile');
            }
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/teacher',
          builder: (context, state) => const TeacherDashboardScreen(),
        ),
        GoRoute(
          path: '/teacher/report',
          builder: (context, state) => const TeacherReportScreen(),
        ),
        GoRoute(
          path: '/teacher/learners',
          builder: (context, state) => const LearnerManagementScreen(),
        ),
        GoRoute(
          path: '/teacher/manage',
          builder: (context, state) => const ManageUsersScreen(),
        ),
        GoRoute(
          path: '/teacher/track-progress',
          builder: (context, state) => const TrackProgressScreen(),
        ),
        GoRoute(
          path: '/teacher/words',
          builder: (context, state) => const WordsScreen(),
        ),
        GoRoute(
          path: '/teacher/feedback',
          builder: (context, state) => const FeedbackScreen(),
        ),
        GoRoute(
          path: '/teacher/profile',
          builder: (context, state) => const TeacherProfileScreen(),
        ),
      ],
    ),

    // ── Coordinator Screens (wrapped in bottom nav shell) ──────
    ShellRoute(
      navigatorKey: _coordinatorShellKey,
      builder: (context, state, child) {
        final location = state.uri.toString();
        int index = 0;
        if (location.startsWith('/coordinator/analytics')) {
          index = 1;
        } else if (location.startsWith('/coordinator/supervise')) {
          index = 2;
        } else if (location.startsWith('/coordinator/profile')) {
          index = 3;
        }

        return CoordinatorShell(
          currentIndex: index,
          onDestinationSelected: (i) {
            switch (i) {
              case 0:
                context.go('/coordinator');
              case 1:
                context.go('/coordinator/analytics');
              case 2:
                context.go('/coordinator/supervise');
              case 3:
                context.go('/coordinator/profile');
            }
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/coordinator',
          builder: (context, state) => const CoordinatorDashboardScreen(),
        ),
        GoRoute(
          path: '/coordinator/analytics',
          builder: (context, state) => const ProgramAnalyticsScreen(),
        ),
        GoRoute(
          path: '/coordinator/supervise',
          builder: (context, state) => const SuperviseTeachersScreen(),
        ),
        GoRoute(
          path: '/coordinator/report',
          builder: (context, state) => const CoordinatorReportScreen(),
        ),
        GoRoute(
          path: '/coordinator/profile',
          builder: (context, state) => const CoordinatorProfileScreen(),
        ),
      ],
    ),
  ],
);
