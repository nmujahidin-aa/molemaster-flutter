import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/progress.dart';
import '../../domain/repositories/progress_repository.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc(this._repo) : super(const ProgressState.initial()) {
    on<ProgressLoadRequested>(_onLoad);
    on<ProgressMarkCompletedRequested>(_onMarkCompleted);
    on<ProgressUpdateTrainingBestScoreRequested>(_onUpdateTrainingBest);
  }

  final ProgressRepository _repo;

  Future<void> _onLoad(ProgressLoadRequested e, Emitter<ProgressState> emit) async {
    try {
      emit(state.copyWith(status: ProgressStatus.loading));
      final progress = await _repo.getOrCreate(e.userId);
      emit(state.copyWith(status: ProgressStatus.success, progress: progress));
    } catch (err) {
      emit(state.copyWith(status: ProgressStatus.failure, message: err.toString()));
    }
  }

  Future<void> _onMarkCompleted(ProgressMarkCompletedRequested e, Emitter<ProgressState> emit) async {
    try {
      await _repo.markCompleted(userId: e.userId, materiId: e.materiId);
      final progress = await _repo.getOrCreate(e.userId);
      emit(state.copyWith(status: ProgressStatus.success, progress: progress));
    } catch (err) {
      emit(state.copyWith(status: ProgressStatus.failure, message: err.toString()));
    }
  }

  Future<void> _onUpdateTrainingBest(
    ProgressUpdateTrainingBestScoreRequested e,
    Emitter<ProgressState> emit,
  ) async {
    try {
      await _repo.updateTrainingBestScoreIfHigher(userId: e.userId, newScore: e.newScore);
      final progress = await _repo.getOrCreate(e.userId);
      emit(state.copyWith(status: ProgressStatus.success, progress: progress));
    } catch (err) {
      emit(state.copyWith(status: ProgressStatus.failure, message: err.toString()));
    }
  }
}