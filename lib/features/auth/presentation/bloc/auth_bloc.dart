import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const AuthState.unknown()) {
    on<AuthObserveRequested>(_onObserve);
    on<AuthLoginRequested>(_onLogin);
    on<AuthRegisterRequested>(_onRegister);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthResetPasswordRequested>(_onReset);
    on<AuthProfileRefreshRequested>(_onRefresh);
  }

  final AuthRepository _repo;

  Future<void> _onObserve(AuthObserveRequested event, Emitter<AuthState> emit) async {
    await emit.forEach<AppUser?>(
      _repo.authStateChanges(),
      onData: (user) => user == null ? const AuthState.unauthenticated() : AuthState.authenticated(user),
      onError: (_, __) => const AuthState.unauthenticated(),
    );
  }

  Future<void> _onLogin(AuthLoginRequested event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading, message: null));
      final user = await _repo.login(email: event.email, password: event.password);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, message: e.toString()));
    }
  }

  Future<void> _onRegister(AuthRegisterRequested event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading, message: null));
      final user = await _repo.register(name: event.name, email: event.email, password: event.password);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, message: e.toString()));
    }
  }

  Future<void> _onLogout(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await _repo.logout();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onReset(AuthResetPasswordRequested event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading, message: null));
      await _repo.sendPasswordResetEmail(email: event.email);
      emit(state.copyWith(status: AuthStatus.resetEmailSent));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, message: e.toString()));
    }
  }

  Future<void> _onRefresh(AuthProfileRefreshRequested event, Emitter<AuthState> emit) async {
    final uid = _repo.currentUserId;
    if (uid == null) return;
    final user = await _repo.getUserProfile(uid);
    emit(AuthState.authenticated(user));
  }
}