import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock learner data for user management.
class ManagedLearner {
  final String id;
  final String name;
  final String lrn;
  final int grade;
  final String section;
  final String status;

  const ManagedLearner({
    required this.id,
    required this.name,
    required this.lrn,
    required this.grade,
    required this.section,
    required this.status,
  });
}

final _mockManagedLearners = <ManagedLearner>[
  const ManagedLearner(
    id: 'ml-1',
    name: 'Juan Dela Cruz',
    lrn: '112233445566',
    grade: 1,
    section: 'Sampaguita',
    status: 'on-track',
  ),
  const ManagedLearner(
    id: 'ml-2',
    name: 'Maria Santos',
    lrn: '223344556677',
    grade: 1,
    section: 'Sampaguita',
    status: 'on-track',
  ),
  const ManagedLearner(
    id: 'ml-3',
    name: 'Pedro Reyes',
    lrn: '334455667788',
    grade: 1,
    section: 'Sampaguita',
    status: 'needs-help',
  ),
  const ManagedLearner(
    id: 'ml-4',
    name: 'Ana Luna',
    lrn: '445566778899',
    grade: 1,
    section: 'Sampaguita',
    status: 'on-track',
  ),
  const ManagedLearner(
    id: 'ml-5',
    name: 'Carlo Mendoza',
    lrn: '556677889900',
    grade: 1,
    section: 'Sampaguita',
    status: 'non-reader',
  ),
];

class MockUserManagementNotifier extends StateNotifier<List<ManagedLearner>> {
  MockUserManagementNotifier() : super(_mockManagedLearners);

  void addLearner(ManagedLearner learner) {
    state = [...state, learner];
  }

  void removeLearner(String id) {
    state = state.where((l) => l.id != id).toList();
  }
}

/// Phase 3 stub — will be replaced with Firestore-backed provider in Phase 4.
final userManagementProvider =
    StateNotifierProvider<MockUserManagementNotifier, List<ManagedLearner>>(
        (ref) {
  return MockUserManagementNotifier();
});
