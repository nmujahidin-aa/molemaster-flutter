import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashGoAuth extends SplashState {
  const SplashGoAuth();
}

class SplashGoHome extends SplashState {
  const SplashGoHome();
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SplashInitial());

  final AuthRepository _authRepository;

  Future<void> check() async {
    final uid = _authRepository.currentUserId;
    if (uid == null) {
      emit(const SplashGoAuth());
    } else {
      emit(const SplashGoHome());
    }
  }
}