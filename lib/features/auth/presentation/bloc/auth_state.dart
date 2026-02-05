part of 'auth_bloc.dart';

enum AuthStatus { unknown, loading, authenticated, unauthenticated, resetEmailSent, failure }

class AuthState extends Equatable {
  const AuthState({
    required this.status,
    this.user,
    this.message,
  });

  final AuthStatus status;
  final AppUser? user;
  final String? message;

  const AuthState.unknown() : this(status: AuthStatus.unknown);
  const AuthState.unauthenticated() : this(status: AuthStatus.unauthenticated);
  const AuthState.authenticated(AppUser u) : this(status: AuthStatus.authenticated, user: u);

  AuthState copyWith({AuthStatus? status, AppUser? user, String? message}) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, user, message];
}