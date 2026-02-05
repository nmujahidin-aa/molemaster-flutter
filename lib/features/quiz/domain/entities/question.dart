import 'package:equatable/equatable.dart';

class Question extends Equatable {
  const Question({
    required this.id,
    required this.type,
    required this.materiId,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });

  final String id;
  final String type;
  final int materiId;
  final String question;
  final Map<String, String> options; // A..E
  final String correctAnswer;
  final String explanation;

  @override
  List<Object?> get props => [id, type, materiId, question, options, correctAnswer, explanation];
}