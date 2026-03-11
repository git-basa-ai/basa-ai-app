import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role.dart';

part 'auth_state.freezed.dart';

/// Represents the current authentication state.
@freezed
class AuthState with _$AuthState {
  /// User is authenticated with a known role and uid.
  const factory AuthState.authenticated({
    required String uid,
    required String displayName,
    required UserRole role,
  }) = Authenticated;

  /// User is not authenticated.
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Authentication is loading (checking stored session).
  const factory AuthState.loading() = AuthLoading;
}
