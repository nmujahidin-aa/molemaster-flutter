

import 'package:mole_master/features/chapters/domain/entities/materi_progress.dart';

abstract class MateriRepository {
  Future<MateriProgress> getProgress(String userId);
  Future<void> updateProgress(String userId, MateriProgress progress);
  Future<bool> isMateriUnlocked(String userId, int materiId);
  Future<void> completeMateri(String userId, int materiId);
  Future<void> unlockNextMateri(String userId, int currentMateriId); // Tambahan
  Future<void> resetProgress(String userId); // Tambahan
}