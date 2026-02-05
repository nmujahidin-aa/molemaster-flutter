import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/question_bank.dart';

class LocalQuizRepoImpl implements QuizRepository {
  @override
  Future<List<Question>> getQuestions({required String type, required int materiId}) async {
    final list = QuestionBank.questions(type: type, materiId: materiId);
    if (list.isEmpty) {
      throw Exception('Soal hardcode untuk type="$type", materi_id=$materiId belum tersedia di QuestionBank.');
    }
    return list;
  }
}