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

class SplashGoPretest extends SplashState {
  const SplashGoPretest();
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
      return;
    }

    final profile = await _authRepository.getUserProfile(uid);
    if (!profile.pretestDone) {
      emit(const SplashGoPretest());
    } else {
      emit(const SplashGoHome());
    }
  }
}