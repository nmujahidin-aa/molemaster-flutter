import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/progress.dart';
import '../../domain/repositories/progress_repository.dart';
import '../models/progress_model.dart';

class ProgressRepoImpl implements ProgressRepository {
  ProgressRepoImpl({required FirebaseFirestore firestore}) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<Progress> getOrCreate(String userId) async {
    final ref = _firestore.collection('progress').doc(userId);
    final doc = await ref.get();

    if (!doc.exists) {
      final model = ProgressModel(userId: userId, currentMateri: 1, completedMateri: const []);
      await ref.set(model.toJson());
      return model;
    }
    return ProgressModel.fromJson(doc.data()!);
  }

  @override
  Future<void> markCompleted({required String userId, required int materiId}) async {
    final ref = _firestore.collection('progress').doc(userId);
    await _firestore.runTransaction((tx) async {
      final doc = await tx.get(ref);
      final data = doc.data() ?? {};
      final model = ProgressModel.fromJson({
        'user_id': userId,
        'current_materi': (data['current_materi'] as num?)?.toInt() ?? 1,
        'completed_materi': (data['completed_materi'] as List<dynamic>?) ?? [],
      });

      final set = model.completedMateri.toSet()..add(materiId);
      final nextCurrent = (model.currentMateri <= materiId) ? (materiId + 1) : model.currentMateri;
      final cappedCurrent = nextCurrent.clamp(1, 7);

      tx.set(ref, {
        'user_id': userId,
        'completed_materi': set.toList()..sort(),
        'current_materi': cappedCurrent,
      }, SetOptions(merge: true));
    });
  }

  @override
  Future<void> setCurrentMateri({required String userId, required int currentMateri}) async {
    final ref = _firestore.collection('progress').doc(userId);
    await ref.set({'current_materi': currentMateri}, SetOptions(merge: true));
  }

    @override
  Future<void> updateTrainingBestScoreIfHigher({required String userId, required int newScore}) async {
    final ref = _firestore.collection('progress').doc(userId);

    await _firestore.runTransaction((tx) async {
      final doc = await tx.get(ref);

      // kalau doc belum ada, buat default dulu
      if (!doc.exists) {
        tx.set(ref, {
          'user_id': userId,
          'current_materi': 1,
          'completed_materi': <int>[],
          'training_best_score': newScore,
        });
        return;
      }

      final data = doc.data() ?? {};
      final currentBest = (data['training_best_score'] as num?)?.toInt();

      // update hanya jika null atau newScore > currentBest
      if (currentBest == null || newScore > currentBest) {
        tx.set(ref, {'training_best_score': newScore}, SetOptions(merge: true));
      }
    });
  }
}