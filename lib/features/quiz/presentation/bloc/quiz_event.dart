part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
  @override
  List<Object?> get props => [];
}

class QuizLoadRequested extends QuizEvent {
  const QuizLoadRequested({required this.type, required this.materiId});
  final String type;
  final int materiId;

  @override
  List<Object?> get props => [type, materiId];
}

class QuizAnswerSelected extends QuizEvent {
  const QuizAnswerSelected({required this.choice});
  final String choice; // A..E

  @override
  List<Object?> get props => [choice];
}

class QuizNextRequested extends QuizEvent {
  const QuizNextRequested();
}

class QuizResetRequested extends QuizEvent {
  const QuizResetRequested();
}