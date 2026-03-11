import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/achievement.dart';
import '../../domain/entities/learner_progress.dart';
import '../../domain/entities/struggle_word.dart';

/// Mock progress provider returning hardcoded learner progress.
///
/// Phase 3 stub — will be replaced with Hive-backed provider in Phase 4.
final progressProvider = Provider<LearnerProgress>((ref) {
  return const LearnerProgress(
    learnerId: 'mock-learner-uid-001',
    totalXp: 720,
    level: 3,
    xpForNextLevel: 1000,
    completedLessons: 5,
    totalLessons: 8,
    completedLessonIds: [
      'lesson-aa',
      'lesson-ee',
      'lesson-ii',
      'lesson-oo',
      'lesson-uu'
    ],
  );
});

/// Mock achievements provider.
final achievementsProvider = Provider<List<Achievement>>((ref) {
  return [
    Achievement(
      id: 'ach-1',
      title: 'First Lesson!',
      icon: '🌟',
      earned: true,
      earnedAt: DateTime(2024, 6, 1),
    ),
    Achievement(
      id: 'ach-2',
      title: 'Level Up!',
      icon: '🏆',
      earned: true,
      earnedAt: DateTime(2024, 6, 15),
    ),
    const Achievement(
      id: 'ach-3',
      title: 'Quiz Master',
      icon: '📝',
      earned: false,
    ),
    const Achievement(
      id: 'ach-4',
      title: 'Bookworm',
      icon: '📚',
      earned: false,
    ),
    const Achievement(
      id: 'ach-5',
      title: 'Perfect Score!',
      icon: '💯',
      earned: false,
    ),
  ];
});

/// Mock struggle words provider.
final struggleWordsProvider = Provider<List<StruggleWord>>((ref) {
  return const [
    StruggleWord(id: 'sw-1', word: 'bata', phoneme: 'Bb', failCount: 4),
    StruggleWord(id: 'sw-2', word: 'keso', phoneme: 'Kk', failCount: 3),
    StruggleWord(id: 'sw-3', word: 'daga', phoneme: 'Dd', failCount: 3),
  ];
});
