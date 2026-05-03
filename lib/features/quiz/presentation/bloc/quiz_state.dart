part of 'quiz_bloc.dart';

enum QuizStatus { initial, loading, ready, finished, failure }

class QuizState extends Equatable {
  const QuizState({
    required this.status,
    this.questions = const [],
    this.index = 0,
    this.answers = const {},
    this.flagged = const {},
    this.isSubmitted = false,
    this.results = const {},
    this.message,
  });

  const QuizState.initial() : this(status: QuizStatus.initial);
  const QuizState.loading() : this(status: QuizStatus.loading);
  const QuizState.failure(String msg)
      : this(status: QuizStatus.failure, message: msg);

  const QuizState.ready({required List<Question> questions})
      : this(
          status: QuizStatus.ready,
          questions: questions,
        );

  final QuizStatus status;
  final List<Question> questions;
  final int index;

  final Map<int, String> answers;
  final Set<int> flagged;

  final bool isSubmitted;
  final Map<int, bool> results;

  final String? message;

  Question? get currentQuestion =>
      (questions.isNotEmpty) ? questions[index] : null;

  int get total => questions.length;

  String? get selected => answers[index];

  bool get isAnswered => answers.containsKey(index);

  bool? get isCorrect {
    if (!isSubmitted) return null;
    return results[index];
  }

  int get correctCount =>
      results.values.where((e) => e).length;

  int get scorePercent =>
      total == 0 ? 0 : ((correctCount / total) * 100).round();

  QuizState copyWith({
    QuizStatus? status,
    List<Question>? questions,
    int? index,
    Map<int, String>? answers,
    Set<int>? flagged,
    bool? isSubmitted,
    Map<int, bool>? results,
    String? message,
  }) {
    return QuizState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      index: index ?? this.index,
      answers: answers ?? this.answers,
      flagged: flagged ?? this.flagged,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      results: results ?? this.results,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        questions,
        index,
        answers,
        flagged,
        isSubmitted,
        results,
        message,
      ];
}