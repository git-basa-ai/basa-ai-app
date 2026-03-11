import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Teacher supervision data for coordinator.
class SupervisedTeacher {
  final String id;
  final String name;
  final String className;
  final int learnerCount;
  final String lastLogin;
  final int onTrack;
  final int needsHelp;
  final int nonReaders;

  const SupervisedTeacher({
    required this.id,
    required this.name,
    required this.className,
    required this.learnerCount,
    required this.lastLogin,
    required this.onTrack,
    required this.needsHelp,
    required this.nonReaders,
  });
}

final _mockSupervisedTeachers = <SupervisedTeacher>[
  const SupervisedTeacher(
    id: 'st-1',
    name: 'Gng. Santos',
    className: 'G1 – Sampaguita',
    learnerCount: 30,
    lastLogin: 'Mar 11, 2026',
    onTrack: 18,
    needsHelp: 8,
    nonReaders: 4,
  ),
  const SupervisedTeacher(
    id: 'st-2',
    name: 'Gng. Santos',
    className: 'G1 – Rosal',
    learnerCount: 28,
    lastLogin: 'Mar 11, 2026',
    onTrack: 15,
    needsHelp: 9,
    nonReaders: 4,
  ),
  const SupervisedTeacher(
    id: 'st-3',
    name: 'G. Reyes',
    className: 'G2 – Dahlia',
    learnerCount: 26,
    lastLogin: 'Mar 10, 2026',
    onTrack: 19,
    needsHelp: 5,
    nonReaders: 2,
  ),
  const SupervisedTeacher(
    id: 'st-4',
    name: 'G. Reyes',
    className: 'G2 – Jasmin',
    learnerCount: 26,
    lastLogin: 'Mar 10, 2026',
    onTrack: 14,
    needsHelp: 8,
    nonReaders: 4,
  ),
  const SupervisedTeacher(
    id: 'st-5',
    name: 'Gng. Cruz',
    className: 'G1 – Orchid',
    learnerCount: 18,
    lastLogin: 'Mar 9, 2026',
    onTrack: 10,
    needsHelp: 5,
    nonReaders: 3,
  ),
  const SupervisedTeacher(
    id: 'st-6',
    name: 'Gng. Cruz',
    className: 'G1 – Lily',
    learnerCount: 17,
    lastLogin: 'Mar 9, 2026',
    onTrack: 12,
    needsHelp: 3,
    nonReaders: 2,
  ),
];

/// Phase 3 stub — will be replaced with Firestore-backed provider in Phase 4.
final teacherSupervisionProvider = Provider<List<SupervisedTeacher>>((ref) {
  return _mockSupervisedTeachers;
});
