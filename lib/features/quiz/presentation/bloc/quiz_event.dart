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
  final String choice;

  @override
  List<Object?> get props => [choice];
}

class QuizNextRequested extends QuizEvent {}

class QuizPrevRequested extends QuizEvent {}

class QuizToggleFlag extends QuizEvent {}

class QuizJumpToQuestion extends QuizEvent {
  const QuizJumpToQuestion(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}

class QuizSubmitRequested extends QuizEvent {}

class QuizResetRequested extends QuizEvent {}