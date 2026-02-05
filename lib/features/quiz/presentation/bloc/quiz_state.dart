part of 'quiz_bloc.dart';

enum QuizStatus { initial, loading, ready, finished, failure }

class QuizState extends Equatable {
  const QuizState({
    required this.status,
    this.questions = const [],
    this.index = 0,
    this.correctCount = 0,
    this.isAnswered = false,
    this.selected,
    this.isCorrect,
    this.message,
  });

  const QuizState.initial() : this(status: QuizStatus.initial);
  const QuizState.loading() : this(status: QuizStatus.loading);
  const QuizState.failure(String msg) : this(status: QuizStatus.failure, message: msg);

  const QuizState.ready({required List<Question> questions})
      : this(
          status: QuizStatus.ready,
          questions: questions,
          index: 0,
          correctCount: 0,
          isAnswered: false,
        );

  final QuizStatus status;
  final List<Question> questions;
  final int index;
  final int correctCount;

  final bool isAnswered;
  final String? selected;
  final bool? isCorrect;

  final String? message;

  Question? get currentQuestion => (status == QuizStatus.ready && questions.isNotEmpty) ? questions[index] : null;

  int get total => questions.length;

  int get scorePercent => total == 0 ? 0 : ((correctCount / total) * 100).round();

  QuizState copyWith({
    QuizStatus? status,
    List<Question>? questions,
    int? index,
    int? correctCount,
    bool? isAnswered,
    String? selected,
    bool? isCorrect,
    String? message,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      index: index ?? this.index,
      correctCount: correctCount ?? this.correctCount,
      isAnswered: isAnswered ?? this.isAnswered,
      selected: selected,
      isCorrect: isCorrect,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, questions, index, correctCount, isAnswered, selected, isCorrect, message];
}