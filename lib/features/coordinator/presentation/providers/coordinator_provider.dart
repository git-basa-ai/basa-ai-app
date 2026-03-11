import 'package:flutter_riverpod/flutter_riverpod.dart';

/// School-wide program data for the coordinator dashboard.
class ProgramOverview {
  final int totalLearners;
  final int totalTeachers;
  final int totalClasses;
  final double avgScore;
  final int onTrackPercent;

  const ProgramOverview({
    required this.totalLearners,
    required this.totalTeachers,
    required this.totalClasses,
    required this.avgScore,
    required this.onTrackPercent,
  });
}

/// Teacher summary for coordinator view.
class TeacherSummary {
  final String id;
  final String name;
  final int classCount;
  final int learnerCount;
  final String lastActive;

  const TeacherSummary({
    required this.id,
    required this.name,
    required this.classCount,
    required this.learnerCount,
    required this.lastActive,
  });
}

const _mockOverview = ProgramOverview(
  totalLearners: 145,
  totalTeachers: 6,
  totalClasses: 8,
  avgScore: 72.5,
  onTrackPercent: 62,
);

final _mockTeachers = <TeacherSummary>[
  const TeacherSummary(
    id: 't-1',
    name: 'Gng. Santos',
    classCount: 2,
    learnerCount: 58,
    lastActive: 'Today',
  ),
  const TeacherSummary(
    id: 't-2',
    name: 'G. Reyes',
    classCount: 2,
    learnerCount: 52,
    lastActive: 'Yesterday',
  ),
  const TeacherSummary(
    id: 't-3',
    name: 'Gng. Cruz',
    classCount: 2,
    learnerCount: 35,
    lastActive: '2 days ago',
  ),
];

/// Phase 3 stub — will be replaced with Firestore-backed provider in Phase 4.
final coordinatorOverviewProvider = Provider<ProgramOverview>((ref) {
  return _mockOverview;
});

final coordinatorTeachersProvider = Provider<List<TeacherSummary>>((ref) {
  return _mockTeachers;
});
