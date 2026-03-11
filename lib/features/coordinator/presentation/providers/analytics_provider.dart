import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Reading level distribution data.
class ReadingLevelData {
  final String level;
  final int count;
  final double percent;

  const ReadingLevelData({
    required this.level,
    required this.count,
    required this.percent,
  });
}

/// Weekly score trend data point.
class ScoreTrend {
  final String week;
  final double avgScore;

  const ScoreTrend({required this.week, required this.avgScore});
}

/// Section comparison data.
class SectionComparison {
  final String className;
  final double avgScore;
  final int onTrackPercent;

  const SectionComparison({
    required this.className,
    required this.avgScore,
    required this.onTrackPercent,
  });
}

/// Struggling word with school-wide count.
class SchoolStruggleWord {
  final String word;
  final int count;

  const SchoolStruggleWord({required this.word, required this.count});
}

final _mockReadingLevels = <ReadingLevelData>[
  const ReadingLevelData(level: 'Non-reader', count: 12, percent: 8.3),
  const ReadingLevelData(level: 'Frustration', count: 30, percent: 20.7),
  const ReadingLevelData(level: 'Instructional', count: 65, percent: 44.8),
  const ReadingLevelData(level: 'Independent', count: 38, percent: 26.2),
];

final _mockScoreTrends = <ScoreTrend>[
  const ScoreTrend(week: 'Week 1', avgScore: 58.0),
  const ScoreTrend(week: 'Week 2', avgScore: 62.5),
  const ScoreTrend(week: 'Week 3', avgScore: 67.0),
  const ScoreTrend(week: 'Week 4', avgScore: 72.5),
];

final _mockStruggleWords = <SchoolStruggleWord>[
  const SchoolStruggleWord(word: 'bata', count: 28),
  const SchoolStruggleWord(word: 'daga', count: 22),
  const SchoolStruggleWord(word: 'keso', count: 18),
  const SchoolStruggleWord(word: 'gatas', count: 15),
  const SchoolStruggleWord(word: 'puno', count: 12),
];

final _mockSectionComparisons = <SectionComparison>[
  const SectionComparison(
      className: 'G1 – Sampaguita', avgScore: 75.0, onTrackPercent: 68),
  const SectionComparison(
      className: 'G1 – Rosal', avgScore: 70.0, onTrackPercent: 62),
  const SectionComparison(
      className: 'G2 – Dahlia', avgScore: 78.5, onTrackPercent: 72),
  const SectionComparison(
      className: 'G2 – Jasmin', avgScore: 65.0, onTrackPercent: 55),
];

/// Phase 3 stubs — will be replaced with Firestore aggregation in Phase 4.
final readingLevelProvider = Provider<List<ReadingLevelData>>((ref) {
  return _mockReadingLevels;
});

final scoreTrendProvider = Provider<List<ScoreTrend>>((ref) {
  return _mockScoreTrends;
});

final schoolStruggleWordsProvider = Provider<List<SchoolStruggleWord>>((ref) {
  return _mockStruggleWords;
});

final sectionComparisonProvider = Provider<List<SectionComparison>>((ref) {
  return _mockSectionComparisons;
});
