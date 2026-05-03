import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_progress.dart';
import 'package:mole_master/features/chapters/domain/repositories/materi_repository.dart';
import 'package:mole_master/features/chapters/logic/utils/materi_unlock_logic.dart';

class MateriRepositoryImpl implements MateriRepository {
  final FirebaseFirestore _firestore;
  final MateriUnlockLogic _unlockLogic;
  
  MateriRepositoryImpl(
    this._firestore, [
    MateriUnlockLogic? unlockLogic,
  ]) : _unlockLogic = unlockLogic ?? MateriUnlockLogic();
  
  @override
  Future<MateriProgress> getProgress(String userId) async {
    try {
      final doc = await _firestore
          .collection('user_progress')
          .doc(userId)
          .get();
      
      if (doc.exists) {
        return MateriProgress.fromFirestore(doc.data()!, userId: '');
      }
      
      // Jika belum ada progress, buat progress default
      const defaultProgress = MateriProgress(
        currentMateri: 1,
        completedMateri: {},
        lastUpdated: null, userId: '',
      );
      
      // Simpan progress default ke Firestore
      await _firestore
          .collection('user_progress')
          .doc(userId)
          .set(defaultProgress.toFirestore());
      
      return defaultProgress;
    } catch (e) {
      throw Exception('Failed to get progress: $e');
    }
  }
  
  @override
  Future<void> updateProgress(String userId, MateriProgress progress) async {
    try {
      await _firestore
          .collection('user_progress')
          .doc(userId)
          .update(progress.toFirestore());
    } catch (e) {
      throw Exception('Failed to update progress: $e');
    }
  }
  
  @override
  Future<bool> isMateriUnlocked(String userId, int materiId) async {
    try {
      final progress = await getProgress(userId);
      return _unlockLogic.isUnlocked(
        materiId: materiId,
        currentMateri: progress.currentMateri,
        completedMateri: progress.completedMateri,
      );
    } catch (e) {
      throw Exception('Failed to check unlock status: $e');
    }
  }
  
  @override
  Future<void> completeMateri(String userId, int materiId) async {
    try {
      final progress = await getProgress(userId);
      
      // Tambahkan materiId ke completed set
      final newCompleted = Set<int>.from(progress.completedMateri);
      newCompleted.add(materiId);
      
      // Hitung current materi berikutnya
      int newCurrentMateri = progress.currentMateri;
      
      // Jika materi yang diselesaikan adalah materi saat ini atau lebih besar
      if (materiId >= progress.currentMateri) {
        // Cari materi berikutnya yang belum selesai
        int nextMateri = materiId + 1;
        while (nextMateri <= 7 && newCompleted.contains(nextMateri)) {
          nextMateri++;
        }
        newCurrentMateri = nextMateri <= 7 ? nextMateri : progress.currentMateri;
      }
      
      final updatedProgress = MateriProgress(
        currentMateri: newCurrentMateri,
        completedMateri: newCompleted,
        lastUpdated: DateTime.now(), userId: '',
      );
      
      await updateProgress(userId, updatedProgress);
    } catch (e) {
      throw Exception('Failed to complete materi: $e');
    }
  }
  
  // Method tambahan: Unlock materi berikutnya secara otomatis
  Future<void> unlockNextMateri(String userId, int currentMateriId) async {
    try {
      final progress = await getProgress(userId);
      final nextMateriId = currentMateriId + 1;
      
      if (nextMateriId <= 7) {
        final isNextUnlocked = _unlockLogic.isUnlocked(
          materiId: nextMateriId,
          currentMateri: progress.currentMateri,
          completedMateri: progress.completedMateri,
        );
        
        if (!isNextUnlocked) {
          final updatedProgress = MateriProgress(
            currentMateri: nextMateriId,
            completedMateri: progress.completedMateri,
            lastUpdated: DateTime.now(), userId: '',
          );
          await updateProgress(userId, updatedProgress);
        }
      }
    } catch (e) {
      throw Exception('Failed to unlock next materi: $e');
    }
  }
  
  // Method tambahan: Reset progress (untuk testing atau reset user)
  Future<void> resetProgress(String userId) async {
    try {
      const defaultProgress = MateriProgress(
        currentMateri: 1,
        completedMateri: {},
        lastUpdated: null, userId: '',
      );
      
      await _firestore
          .collection('user_progress')
          .doc(userId)
          .set(defaultProgress.toFirestore());
    } catch (e) {
      throw Exception('Failed to reset progress: $e');
    }
  }
  
  // Method tambahan: Get completed materi list
  Future<List<int>> getCompletedMateri(String userId) async {
    try {
      final progress = await getProgress(userId);
      return progress.completedMateri.toList();
    } catch (e) {
      throw Exception('Failed to get completed materi: $e');
    }
  }
  
  // Method tambahan: Get current materi
  Future<int> getCurrentMateri(String userId) async {
    try {
      final progress = await getProgress(userId);
      return progress.currentMateri;
    } catch (e) {
      throw Exception('Failed to get current materi: $e');
    }
  }
}