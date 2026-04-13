import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../quiz/domain/entities/question.dart';
import '../../../quiz/domain/repositories/quiz_repository.dart';

part 'adventure_event.dart';
part 'adventure_state.dart';

class AdventureBloc extends Bloc<AdventureEvent, AdventureState> {
  AdventureBloc(this._quizRepo) : super(const AdventureState.initial()) {
    on<AdventureStarted>(_onStarted);
    on<AdventureOptionSelected>(_onSelected);
    on<AdventureNextRequested>(_onNext);
    on<AdventureRestartRequested>(_onRestart);
  }

  final QuizRepository _quizRepo;

  Future<void> _onStarted(AdventureStarted e, Emitter<AdventureState> emit) async {
    emit(const AdventureState.loading());
    final qs = await _quizRepo.getQuestions(type: 'adventure', materiId: 0); // hardcode repo
    emit(AdventureState.playing(
      questions: qs,
      hearts: 3,
      stars: 0,
      streak: 0,
      index: 0,
    ));
  }

  Future<void> _onSelected(AdventureOptionSelected e, Emitter<AdventureState> emit) async {
    if (!state.isPlaying || state.isAnswered) return;

    final q = state.currentQuestion!;
    final correct = e.option == q.correctAnswer;

    if (correct) {
      final nextStreak = state.streak + 1;
      final streakBonus = (nextStreak * 2).clamp(0, 10);
      final gained = 10 + streakBonus;

      emit(state.copyWith(
        isAnswered: true,
        selected: e.option,
        lastCorrect: true,
        streak: nextStreak,
        stars: state.stars + gained,
        lastGainedStars: gained,
        showCombo: nextStreak >= 3,
      ));
    } else {
      final nextHearts = state.hearts - 1;
      emit(state.copyWith(
        isAnswered: true,
        selected: e.option,
        lastCorrect: false,
        hearts: nextHearts,
        streak: 0,
        lastGainedStars: 0,
        showCombo: false,
      ));
    }
  }

  Future<void> _onNext(AdventureNextRequested e, Emitter<AdventureState> emit) async {
    if (!state.isPlaying) return;

    // kalau hearts habis -> finish
    if (state.hearts <= 0) {
      emit(state.copyWith(status: AdventureStatus.finished));
      return;
    }

    final next = state.index + 1;
    if (next >= state.questions.length) {
      emit(state.copyWith(status: AdventureStatus.finished));
      return;
    }

    emit(state.copyWith(
      index: next,
      isAnswered: false,
      selected: null,
      lastCorrect: null,
      lastGainedStars: 0,
      showCombo: false,
    ));
  }

  Future<void> _onRestart(AdventureRestartRequested e, Emitter<AdventureState> emit) async {
    add(const AdventureStarted());
  }
}