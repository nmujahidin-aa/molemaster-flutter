import '../entities/progress.dart';

abstract class ProgressRepository {
  Future<Progress> getOrCreate(String userId);
  Future<void> markCompleted({required String userId, required int materiId});
  Future<void> setCurrentMateri({required String userId, required int currentMateri});
}