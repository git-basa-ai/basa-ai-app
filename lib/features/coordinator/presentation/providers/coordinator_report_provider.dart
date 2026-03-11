import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Phil-IRI comparison entry for coordinator report.
class PhilIriEntry {
  final String name;
  final double preTest;
  final double postTest;

  double get delta => postTest - preTest;

  const PhilIriEntry({
    required this.name,
    required this.preTest,
    required this.postTest,
  });
}

/// Section summary for coordinator report.
class SectionReportEntry {
  final String className;
  final String teacher;
  final int learnerCount;
  final double avgScore;
  final int onTrack;

  const SectionReportEntry({
    required this.className,
    required this.teacher,
    required this.learnerCount,
    required this.avgScore,
    required this.onTrack,
  });
}

final _mockPhilIri = <PhilIriEntry>[
  const PhilIriEntry(name: 'Juan D.', preTest: 35.0, postTest: 72.0),
  const PhilIriEntry(name: 'Maria S.', preTest: 40.0, postTest: 78.0),
  const PhilIriEntry(name: 'Pedro R.', preTest: 20.0, postTest: 55.0),
  const PhilIriEntry(name: 'Ana L.', preTest: 50.0, postTest: 88.0),
  const PhilIriEntry(name: 'Carlo M.', preTest: 15.0, postTest: 38.0),
];

final _mockSections = <SectionReportEntry>[
  const SectionReportEntry(
    className: 'G1 – Sampaguita',
    teacher: 'Gng. Santos',
    learnerCount: 30,
    avgScore: 75.0,
    onTrack: 18,
  ),
  const SectionReportEntry(
    className: 'G1 – Rosal',
    teacher: 'Gng. Santos',
    learnerCount: 28,
    avgScore: 70.0,
    onTrack: 15,
  ),
  const SectionReportEntry(
    className: 'G2 – Dahlia',
    teacher: 'G. Reyes',
    learnerCount: 26,
    avgScore: 78.5,
    onTrack: 19,
  ),
  const SectionReportEntry(
    className: 'G2 – Jasmin',
    teacher: 'G. Reyes',
    learnerCount: 26,
    avgScore: 65.0,
    onTrack: 14,
  ),
];

/// Phase 3 stub — will be replaced with real Firestore data in Phase 4.
final philIriProvider = Provider<List<PhilIriEntry>>((ref) {
  return _mockPhilIri;
});

final sectionReportProvider = Provider<List<SectionReportEntry>>((ref) {
  return _mockSections;
});
