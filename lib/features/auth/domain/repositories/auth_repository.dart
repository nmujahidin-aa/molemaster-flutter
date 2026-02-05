import '../entities/app_user.dart';

abstract class AuthRepository {
  String? get currentUserId;

  Stream<AppUser?> authStateChanges();

  Future<AppUser> login({required String email, required String password});
  Future<AppUser> register({required String name, required String email, required String password});
  Future<void> logout();
  Future<void> sendPasswordResetEmail({required String email});

  Future<AppUser> getUserProfile(String uid);
  Future<void> setPretestDone(String uid, bool value);
}
