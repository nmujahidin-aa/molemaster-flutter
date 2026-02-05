import '../entities/question.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuestions({required String type, required int materiId});
}