import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../models/question_model.dart';

class QuizRepoImpl implements QuizRepository {
  QuizRepoImpl({required FirebaseFirestore firestore}) : _firestore = firestore;
  final FirebaseFirestore _firestore;

  @override
  Future<List<Question>> getQuestions({required String type, required int materiId}) async {
    Query<Map<String, dynamic>> q = _firestore.collection('questions').where('type', isEqualTo: type);

    // materiId 0 = global
    q = q.where('materi_id', isEqualTo: materiId);

    final snap = await q.get();
    return snap.docs.map((d) => QuestionModel.fromDoc(d.data(), d.id)).toList();
  }
}