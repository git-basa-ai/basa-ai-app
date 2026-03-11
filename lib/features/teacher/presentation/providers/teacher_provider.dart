import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/activity_event.dart';
import '../../domain/entities/class_info.dart';

/// Mock class data for the teacher dashboard.
final _mockClasses = <ClassInfo>[
  const ClassInfo(
    id: 'class-1',
    name: 'Grade 1 — Sampaguita',
    grade: 1,
    section: 'Sampaguita',
    totalLearners: 30,
    onTrack: 18,
    needsHelp: 8,
    nonReaders: 4,
  ),
  const ClassInfo(
    id: 'class-2',
    name: 'Grade 1 — Rosal',
    grade: 1,
    section: 'Rosal',
    totalLearners: 28,
    onTrack: 15,
    needsHelp: 9,
    nonReaders: 4,
  ),
];

/// Mock recent activity feed events.
final _mockActivity = <ActivityEvent>[
  ActivityEvent(
    id: 'act-1',
    learnerName: 'Juan D.',
    description: 'Completed Lesson: Tunog ng Letrang Aa',
    timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  ActivityEvent(
    id: 'act-2',
    learnerName: 'Maria S.',
    description: 'Scored 4/5 on Quiz: Letrang Ee',
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  ActivityEvent(
    id: 'act-3',
    learnerName: 'Pedro R.',
    description: 'Struggle word flagged: bata',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  ActivityEvent(
    id: 'act-4',
    learnerName: 'Ana L.',
    description: 'Level up! Now Level 2',
    timestamp: DateTime.now().subtract(const Duration(hours: 4)),
  ),
];

/// Provides the list of classes for the current teacher.
///
/// Phase 3 stub — will be replaced with Firestore-backed provider in Phase 4.
final classListProvider = Provider<List<ClassInfo>>((ref) {
  return _mockClasses;
});

/// Currently selected class index.
final selectedClassIndexProvider = StateProvider<int>((ref) => 0);

/// Provides the currently selected class info.
final selectedClassProvider = Provider<ClassInfo>((ref) {
  final index = ref.watch(selectedClassIndexProvider);
  final classes = ref.watch(classListProvider);
  return classes[index];
});

/// Provides recent activity events.
final activityFeedProvider = Provider<List<ActivityEvent>>((ref) {
  return _mockActivity;
});
