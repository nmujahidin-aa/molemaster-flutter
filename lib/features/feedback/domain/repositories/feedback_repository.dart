abstract class FeedbackRepository {
  Future<void> submit({required String userId, required String title, required String message});
}