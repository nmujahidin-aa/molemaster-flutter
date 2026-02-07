import '../models/question_model.dart';
import 'question_bank_pretest.dart';
import 'question_bank_posttest.dart';
import 'question_bank_adventure.dart';
import 'question_bank_training.dart';
import 'question_bank_chapter_test.dart';

class QuestionBank {
  static List<QuestionModel> questions({required String type, required int materiId}) {
    switch (type) {
      case 'pretest':
        return pretestQuestions;

      case 'posttest':
        return materiId == 0 ? posttestQuestions : const [];

      case 'chapter_test':
        return chapterTestQuestions[materiId] ?? const [];

      case 'adventure':
        return adventureQuestions;

      case 'training':
        return trainingQuestions;

      default:
        return const [];
    }
  }
}