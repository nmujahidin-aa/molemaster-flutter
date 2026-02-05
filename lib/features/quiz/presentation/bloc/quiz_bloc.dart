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
    on<QuizResetRequested>(_onReset);
  }

  final QuizRepository _repo;

  Future<void> _onLoad(QuizLoadRequested e, Emitter<QuizState> emit) async {
    try {
      emit(const QuizState.loading());
      final questions = await _repo.getQuestions(type: e.type, materiId: e.materiId);
      if (questions.isEmpty) {
        emit(const QuizState.failure('Soal belum tersedia. Tambahkan dokumen di Firestore collection "questions".'));
        return;
      }
      emit(QuizState.ready(questions: questions));
    } catch (err) {
      emit(QuizState.failure(err.toString()));
    }
  }

  Future<void> _onAnswer(QuizAnswerSelected e, Emitter<QuizState> emit) async {
    if (state.status != QuizStatus.ready) return;
    if (state.isAnswered) return;

    final q = state.currentQuestion!;
    final isCorrect = e.choice == q.correctAnswer;

    emit(state.copyWith(
      isAnswered: true,
      selected: e.choice,
      isCorrect: isCorrect,
      correctCount: isCorrect ? state.correctCount + 1 : state.correctCount,
    ));
  }

  Future<void> _onNext(QuizNextRequested e, Emitter<QuizState> emit) async {
    if (state.status != QuizStatus.ready) return;

    final nextIndex = state.index + 1;
    if (nextIndex >= state.questions.length) {
      emit(state.copyWith(status: QuizStatus.finished));
      return;
    }

    emit(state.copyWith(
      index: nextIndex,
      isAnswered: false,
      selected: null,
      isCorrect: null,
    ));
  }

  Future<void> _onReset(QuizResetRequested e, Emitter<QuizState> emit) async {
    emit(const QuizState.initial());
  }
}