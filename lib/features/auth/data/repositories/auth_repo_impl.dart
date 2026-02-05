import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRepoImpl({required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  String? get currentUserId => _auth.currentUser?.uid;

  @override
  Stream<AppUser?> authStateChanges() async* {
    await for (final user in _auth.authStateChanges()) {
      if (user == null) {
        yield null;
      } else {
        yield await getUserProfile(user.uid);
      }
    }
  }

  @override
  Future<AppUser> login({required String email, required String password}) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final uid = cred.user!.uid;
    return getUserProfile(uid);
  }

  @override
  Future<AppUser> register({required String name, required String email, required String password}) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = cred.user!.uid;

    final model = UserModel(id: uid, name: name, email: email, pretestDone: false);
    await _firestore.collection('users').doc(uid).set(model.toJson(), SetOptions(merge: true));
    return model;
  }

  @override
  Future<void> logout() => _auth.signOut();

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<AppUser> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) {
      final fallback = UserModel(
        id: uid,
        name: _auth.currentUser?.displayName ?? 'Siswa',
        email: _auth.currentUser?.email ?? '-',
        pretestDone: false,
      );
      await _firestore.collection('users').doc(uid).set(fallback.toJson(), SetOptions(merge: true));
      return fallback;
    }
    return UserModel.fromJson(doc.id, doc.data()!);
  }

  @override
  Future<void> setPretestDone(String uid, bool value) {
    return _firestore.collection('users').doc(uid).set(
      {'pretest_done': value},
      SetOptions(merge: true),
    );
  }
}