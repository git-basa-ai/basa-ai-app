import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Activity log entry for learner progress tracking.
class ActivityLogEntry {
  final String date;
  final String lesson;
  final int score;
  final String duration;

  const ActivityLogEntry({
    required this.date,
    required this.lesson,
    required this.score,
    required this.duration,
  });
}

/// Detailed learner progress for the Track Learner Progress screen.
class LearnerDetail {
  final String name;
  final String lrn;
  final String gradeSection;
  final String readingLevel;
  final int lessonsCompleted;
  final int totalLessons;
  final double avgScore;
  final bool isImproving;
  final List<ActivityLogEntry> activityLog;

  const LearnerDetail({
    required this.name,
    required this.lrn,
    required this.gradeSection,
    required this.readingLevel,
    required this.lessonsCompleted,
    required this.totalLessons,
    required this.avgScore,
    required this.isImproving,
    required this.activityLog,
  });
}

final _mockLearnerDetail = LearnerDetail(
  name: 'Juan Dela Cruz',
  lrn: '112233445566',
  gradeSection: 'Grade 1 — Sampaguita',
  readingLevel: 'Instructional',
  lessonsCompleted: 8,
  totalLessons: 20,
  avgScore: 78.0,
  isImproving: true,
  activityLog: const [
    ActivityLogEntry(
      date: 'Mar 10',
      lesson: 'Letrang Mm',
      score: 85,
      duration: '12 min',
    ),
    ActivityLogEntry(
      date: 'Mar 9',
      lesson: 'Letrang Ss',
      score: 80,
      duration: '10 min',
    ),
    ActivityLogEntry(
      date: 'Mar 8',
      lesson: 'Letrang Bb',
      score: 70,
      duration: '15 min',
    ),
    ActivityLogEntry(
      date: 'Mar 7',
      lesson: 'Letrang Aa',
      score: 90,
      duration: '8 min',
    ),
    ActivityLogEntry(
      date: 'Mar 6',
      lesson: 'Letrang Ee',
      score: 65,
      duration: '14 min',
    ),
  ],
);

/// Phase 3 stub — will be replaced with Hive/Firestore provider in Phase 4.
final learnerDetailProvider = Provider<LearnerDetail>((ref) {
  return _mockLearnerDetail;
});
