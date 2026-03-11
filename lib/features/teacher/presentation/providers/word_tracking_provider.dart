import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A tracked word (either struggling or mastered).
class TrackedWord {
  final String word;
  final bool isMastered;
  final int failCount;
  final String? masteredDate;

  const TrackedWord({
    required this.word,
    required this.isMastered,
    this.failCount = 0,
    this.masteredDate,
  });
}

final _mockTrackedWords = <TrackedWord>[
  const TrackedWord(word: 'bata', isMastered: false, failCount: 5),
  const TrackedWord(word: 'daga', isMastered: false, failCount: 3),
  const TrackedWord(word: 'keso', isMastered: false, failCount: 4),
  const TrackedWord(word: 'aso', isMastered: true, masteredDate: 'Mar 8'),
  const TrackedWord(word: 'ina', isMastered: true, masteredDate: 'Mar 6'),
  const TrackedWord(word: 'ama', isMastered: true, masteredDate: 'Mar 5'),
  const TrackedWord(word: 'mata', isMastered: true, masteredDate: 'Mar 3'),
];

/// Phase 3 stub — will be replaced with Hive-backed provider in Phase 4.
final wordTrackingProvider = Provider<List<TrackedWord>>((ref) {
  return _mockTrackedWords;
});
