import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/lesson.dart';

/// Mock Marungko Approach phonics lesson data.
final _mockLessons = <Lesson>[
  const Lesson(
    id: 'lesson-aa',
    title: 'Tunog ng Letrang Aa',
    phoneme: 'Aa',
    description: 'Matutunan ang tunog ng letrang Aa.',
    order: 1,
    level: 1,
    completed: true,
    progress: 1.0,
  ),
  const Lesson(
    id: 'lesson-ee',
    title: 'Tunog ng Letrang Ee',
    phoneme: 'Ee',
    description: 'Matutunan ang tunog ng letrang Ee.',
    order: 2,
    level: 1,
    completed: true,
    progress: 1.0,
  ),
  const Lesson(
    id: 'lesson-ii',
    title: 'Tunog ng Letrang Ii',
    phoneme: 'Ii',
    description: 'Matutunan ang tunog ng letrang Ii.',
    order: 3,
    level: 1,
    progress: 0.6,
  ),
  const Lesson(
    id: 'lesson-oo',
    title: 'Tunog ng Letrang Oo',
    phoneme: 'Oo',
    description: 'Matutunan ang tunog ng letrang Oo.',
    order: 4,
    level: 1,
  ),
  const Lesson(
    id: 'lesson-uu',
    title: 'Tunog ng Letrang Uu',
    phoneme: 'Uu',
    description: 'Matutunan ang tunog ng letrang Uu.',
    order: 5,
    level: 1,
  ),
  const Lesson(
    id: 'lesson-bb',
    title: 'Tunog ng Letrang Bb',
    phoneme: 'Bb',
    description: 'Matutunan ang tunog ng letrang Bb at mga salitang may Bb.',
    order: 6,
    level: 2,
  ),
  const Lesson(
    id: 'lesson-kk',
    title: 'Tunog ng Letrang Kk',
    phoneme: 'Kk',
    description: 'Matutunan ang tunog ng letrang Kk at mga salitang may Kk.',
    order: 7,
    level: 2,
  ),
  const Lesson(
    id: 'lesson-dd',
    title: 'Tunog ng Letrang Dd',
    phoneme: 'Dd',
    description: 'Matutunan ang tunog ng letrang Dd at mga salitang may Dd.',
    order: 8,
    level: 2,
  ),
];

/// Provides the list of all phonics lessons.
///
/// Phase 3 stub — will be replaced with Hive-backed provider in Phase 4.
final lessonListProvider = Provider<List<Lesson>>((ref) {
  return _mockLessons;
});

/// Provides a single lesson by ID.
final lessonByIdProvider = Provider.family<Lesson?, String>((ref, id) {
  final lessons = ref.watch(lessonListProvider);
  try {
    return lessons.firstWhere((l) => l.id == id);
  } catch (_) {
    return null;
  }
});
