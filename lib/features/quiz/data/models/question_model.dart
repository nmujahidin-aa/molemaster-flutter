import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.id,
    required super.type,
    required super.materiId,
    required super.question,
    required super.options,
    required super.correctAnswer,
    required super.explanation,
  });

  factory QuestionModel.fromDoc(Map<String, dynamic> json, String id) {
    return QuestionModel(
      id: id,
      type: json['type'] as String,
      materiId: (json['materi_id'] as num).toInt(),
      question: json['question'] as String,
      options: Map<String, String>.from(json['options'] as Map),
      correctAnswer: json['correct_answer'] as String,
      explanation: json['explanation'] as String,
    );
  }
}