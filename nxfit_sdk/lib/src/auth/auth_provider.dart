import 'auth_state.dart';

/// AuthProvider must be supplied to [NxFit.build] and it is used to indicate the current authentication state. Only two states are possible:
/// [Authenticated] and [Unauthenticated]. When the user is authenticated, the [AuthState] will be set to [Authenticated] with an appropriate [accessToken](Authenticated.accessToken)
/// and [userId](Authenticated.userId). Whenever the access token changes, the [AuthState] will be updated with a new instance of [Authenticated]. This will be used by the
/// NxFit SDK when making HTTP calls to the server.
///
/// The same [AuthState] must be provided in two ways:
/// * [currentAuthState] property getter which always returns the most recent [AuthState].
/// * [authState] stream, which NxFit will listen for changes to the [AuthState].
///
/// The [currentAuthState] is used while initializing NxFit and will be referenced before it has a chance to listen for changes. Since a *Stream* may or may not
/// replay the most recent emitted value, the current AuthState value provided as a property getter is also required.
///
/// Example implementation of an AuthManager that emits [Authenticated] when the user logs in:
/// ```dart
/// class AuthManager extends AuthProvider {
///   final BehaviorSubject<AuthState> _authState = BehaviorSubject<AuthState>.seeded(Unauthenticated());
///
///   @override
///   Stream<AuthState> get authState => _authState.stream.asBroadcastStream();
///
///   @override
///   AuthState get currentAuthState => _authState.value;
///
///   login() {
///     // Do login stuff and then emit the new AuthState:
///     _authState.value = Authenticated(accessToken, userId);
///   }
/// ```
/// See also [AuthState], [Authenticated], [Unauthenticated] and [NxFit.build].
abstract class AuthProvider {
  /// The current [AuthState]. It should match the most recently emitted value in the [authState] stream.
  AuthState get currentAuthState;

  /// Stream of [AuthState] changes. When the user is authenticated, the [AuthState] will be set to [Authenticated] with an appropriate [accessToken] and [userId].
  Stream<AuthState> get authState;
}
