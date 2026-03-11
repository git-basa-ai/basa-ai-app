import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/learner_report.dart';

/// Mock learner report data for the teacher report screen.
final _mockReports = <LearnerReport>[
  const LearnerReport(
    learnerId: 'l-001',
    name: 'Juan D.',
    lessonsCompleted: 5,
    avgScore: 85.0,
    status: 'on-track',
    struggleWords: [],
  ),
  const LearnerReport(
    learnerId: 'l-002',
    name: 'Maria S.',
    lessonsCompleted: 4,
    avgScore: 72.0,
    status: 'on-track',
    struggleWords: ['keso'],
  ),
  const LearnerReport(
    learnerId: 'l-003',
    name: 'Pedro R.',
    lessonsCompleted: 3,
    avgScore: 60.0,
    status: 'needs-help',
    struggleWords: ['bata', 'daga'],
  ),
  const LearnerReport(
    learnerId: 'l-004',
    name: 'Ana L.',
    lessonsCompleted: 6,
    avgScore: 92.0,
    status: 'on-track',
    struggleWords: [],
  ),
  const LearnerReport(
    learnerId: 'l-005',
    name: 'Carlo M.',
    lessonsCompleted: 1,
    avgScore: 40.0,
    status: 'non-reader',
    struggleWords: ['aso', 'bata', 'keso'],
  ),
  const LearnerReport(
    learnerId: 'l-006',
    name: 'Sofia T.',
    lessonsCompleted: 2,
    avgScore: 55.0,
    status: 'needs-help',
    struggleWords: ['daga'],
  ),
];

/// Provides per-learner report data.
///
/// Phase 3 stub — will be replaced with Firestore aggregation in Phase 4.
final reportProvider = Provider<List<LearnerReport>>((ref) {
  return _mockReports;
});
