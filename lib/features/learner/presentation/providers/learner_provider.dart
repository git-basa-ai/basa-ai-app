import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/learner.dart';

/// Mock learner provider returning a hardcoded learner profile.
///
/// Phase 3 stub — will be replaced with Hive-backed provider in Phase 4.
final learnerProvider = Provider<Learner>((ref) {
  return const Learner(
    uid: 'mock-learner-uid-001',
    lrn: '100000000001',
    name: 'Juan',
    grade: 1,
    section: 'Sampaguita',
    xp: 720,
    level: 3,
  );
});
