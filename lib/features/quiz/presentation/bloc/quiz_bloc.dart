import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(this._repo) : super(const QuizState.initial()) {
    on<QuizLoadRequested>(_onLoad);
    on<QuizAnswerSelected>(_onAnswer);
    on<QuizNextRequested>(_onNext);
    on<QuizPrevRequested>(_onPrev);
    on<QuizToggleFlag>(_onToggleFlag);
    on<QuizJumpToQuestion>(_onJump);
    on<QuizSubmitRequested>(_onSubmit);
    on<QuizResetRequested>(_onReset);
  }

  final QuizRepository _repo;

  Future<void> _onLoad(QuizLoadRequested e, Emitter<QuizState> emit) async {
    emit(const QuizState.loading());
    try {
      final questions = await _repo.getQuestions(
        type: e.type,
        materiId: e.materiId,
      );
      emit(QuizState.ready(questions: questions));
    } catch (err) {
      emit(QuizState.failure(err.toString()));
    }
  }

  void _onAnswer(QuizAnswerSelected e, Emitter<QuizState> emit) {
    final newAnswers = Map<int, String>.from(state.answers);
    newAnswers[state.index] = e.choice;

    emit(state.copyWith(answers: newAnswers));
  }

  void _onNext(QuizNextRequested e, Emitter<QuizState> emit) {
    if (state.index < state.total - 1) {
      emit(state.copyWith(index: state.index + 1));
    }
  }

  void _onPrev(QuizPrevRequested e, Emitter<QuizState> emit) {
    if (state.index > 0) {
      emit(state.copyWith(index: state.index - 1));
    }
  }

  void _onJump(QuizJumpToQuestion e, Emitter<QuizState> emit) {
    emit(state.copyWith(index: e.index));
  }

  void _onToggleFlag(QuizToggleFlag e, Emitter<QuizState> emit) {
    final flagged = Set<int>.from(state.flagged);
    flagged.contains(state.index)
        ? flagged.remove(state.index)
        : flagged.add(state.index);

    emit(state.copyWith(flagged: flagged));
  }

  void _onSubmit(QuizSubmitRequested e, Emitter<QuizState> emit) {
    final results = <int, bool>{};

    for (int i = 0; i < state.questions.length; i++) {
      final q = state.questions[i];
      results[i] = state.answers[i] == q.correctAnswer;
    }

    emit(state.copyWith(
      isSubmitted: true,
      results: results,
      status: QuizStatus.finished,
    ));
  }

  void _onReset(QuizResetRequested e, Emitter<QuizState> emit) {
    emit(const QuizState.initial());
  }
}