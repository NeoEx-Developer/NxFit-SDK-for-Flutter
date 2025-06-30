/// Used by NxFit consumers to indicate the current authentication state. Only two states are possible: [Authenticated] and [Unauthenticated].
/// When the user is authenticated, the AuthState will be set to Authenticated with the appropriate [accessToken] and [userId]. This will be
/// used by the NxFit SDK when making HTTP calls to the NxFit API server.
///
/// See also [AuthProvider]
sealed class AuthState {}

/// Indicates that the user is authenticated.
final class Authenticated implements AuthState {
  final String accessToken;
  final int userId;

  /// Creates an authenticated state with the given [accessToken] and [userId].
  Authenticated(this.accessToken, this.userId);
}

/// Indicates that the user is not authenticated.
final class Unauthenticated implements AuthState {}

extension AuthStateExtensions on AuthState {
  /// Returns true if the [AuthState] is [Authenticated].
  bool get isAuthenticated => this is Authenticated;

  /// Returns true if the [AuthState] is [Unauthenticated].
  bool get isUnauthenticated => this is Unauthenticated;

  /// Returns the [accessToken] if the [AuthState] is [Authenticated]. Returns null otherwise.
  String? get accessToken => isAuthenticated ? (this as Authenticated).accessToken : null;

  /// Returns the [userId] if the [AuthState] is [Authenticated]. Returns null otherwise.
  int? get userId => isAuthenticated ? (this as Authenticated).userId : null;
}
