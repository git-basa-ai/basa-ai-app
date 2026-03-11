import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/login_screen.dart';
import '../features/dictionary/presentation/screens/dictionary_screen.dart';
import '../features/face_mesh/presentation/screens/mouth_guide_screen.dart';
import '../features/learner/presentation/screens/learner_home_screen.dart';
import '../features/phonics/presentation/screens/lesson_detail_screen.dart';
import '../features/phonics/presentation/screens/lesson_list_screen.dart';
import '../features/phonics/presentation/screens/quiz_screen.dart';
import '../features/progress/presentation/screens/progress_screen.dart';
import '../features/scanner/presentation/screens/qr_scanner_screen.dart';
import '../features/speech/presentation/screens/speech_record_screen.dart';
import '../features/teacher/presentation/screens/learner_management_screen.dart';
import '../features/teacher/presentation/screens/teacher_dashboard_screen.dart';
import '../features/teacher/presentation/screens/teacher_report_screen.dart';

/// Central GoRouter configuration for BASA AI.
///
/// Rule A5: GoRouter is the only navigation pattern — no raw `Navigator.push`.
final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // ── Auth ───────────────────────────────────────────────────
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // ── Learner Screens ────────────────────────────────────────
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
      builder: (context, state) => const SpeechRecordScreen(),
    ),
    GoRoute(
      path: '/learner/mouth-guide',
      builder: (context, state) => const MouthGuideScreen(),
    ),
    GoRoute(
      path: '/learner/scanner',
      builder: (context, state) => const QrScannerScreen(),
    ),
    GoRoute(
      path: '/learner/dictionary',
      builder: (context, state) => const DictionaryScreen(),
    ),
    GoRoute(
      path: '/learner/progress',
      builder: (context, state) => const ProgressScreen(),
    ),

    // ── Teacher Screens ────────────────────────────────────────
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
  ],
);
