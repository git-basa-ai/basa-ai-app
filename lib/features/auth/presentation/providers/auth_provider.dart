import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_state.dart';
import '../../domain/entities/user_role.dart';

/// Mock authentication notifier returning hardcoded auth states.
///
/// Phase 3 stub — will be replaced with Firebase Auth integration in Phase 4.
class MockAuthNotifier extends StateNotifier<AuthState> {
  MockAuthNotifier() : super(const AuthState.unauthenticated());

  /// Simulate learner login with an LRN.
  void loginAsLearner(String lrn) {
    state = const AuthState.authenticated(
      uid: 'mock-learner-uid-001',
      displayName: 'Juan',
      role: UserRole.learner,
    );
  }

  /// Simulate teacher login with email/password.
  void loginAsTeacher(String email, String password) {
    state = const AuthState.authenticated(
      uid: 'mock-teacher-uid-001',
      displayName: 'Gng. Santos',
      role: UserRole.teacher,
    );
  }

  /// Simulate coordinator login with email/password.
  void loginAsCoordinator(String email, String password) {
    state = const AuthState.authenticated(
      uid: 'mock-coordinator-uid-001',
      displayName: 'Dr. Reyes',
      role: UserRole.coordinator,
    );
  }

  /// Sign out the current user.
  void logout() {
    state = const AuthState.unauthenticated();
  }
}

/// Provides the current authentication state.
final authProvider = StateNotifierProvider<MockAuthNotifier, AuthState>((ref) {
  return MockAuthNotifier();
});
