import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/feedback_repository.dart';

class FeedbackRepoImpl implements FeedbackRepository {
  FeedbackRepoImpl({required FirebaseFirestore firestore}) : _firestore = firestore;
  final FirebaseFirestore _firestore;

  @override
  Future<void> submit({required String userId, required String title, required String message}) async {
    await _firestore.collection('feedback').add({
      'user_id': userId,
      'title': title,
      'message': message,
      'created_at': FieldValue.serverTimestamp(),
    });
  }
}