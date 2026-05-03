import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_progress.dart';
import 'package:mole_master/features/chapters/domain/repositories/materi_repository.dart';
import 'materi_event.dart';
import 'materi_state.dart';
import 'package:mole_master/features/chapters/logic/utils/materi_unlock_logic.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriRepository repository;
  final MateriUnlockLogic unlockLogic;
  
  MateriBloc({
    required this.repository,
    required this.unlockLogic,
  }) : super(MateriState.initial()) {
    on<LoadMateriProgress>(_onLoadProgress);
    on<CompleteMateri>(_onCompleteMateri);
    on<UnlockNextMateri>(_onUnlockNextMateri);
    on<CheckMateriUnlock>(_onCheckMateriUnlock);
    on<ResetMateriProgress>(_onResetProgress);
  }
  
  Future<void> _onLoadProgress(
    LoadMateriProgress event,
    Emitter<MateriState> emit,
  ) async {
    emit(state.copyWith(status: MateriStatus.loading));
    try {
      final progress = await repository.getProgress(event.userId);
      emit(state.copyWith(progress: progress, status: MateriStatus.success));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: MateriStatus.failure));
    }
  }
  
  Future<void> _onCompleteMateri(
    CompleteMateri event,
    Emitter<MateriState> emit,
  ) async {
    emit(state.copyWith(status: MateriStatus.loading));
    try {
      // Tandai materi sebagai selesai
      await repository.completeMateri(event.userId, event.materiId);
      
      // Ambil progress terbaru
      final updatedProgress = await repository.getProgress(event.userId);
      
      emit(state.copyWith(
        progress: updatedProgress,
        status: MateriStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        status: MateriStatus.failure,
      ));
    }
  }
  
  Future<void> _onUnlockNextMateri(
    UnlockNextMateri event,
    Emitter<MateriState> emit,
  ) async {
    emit(state.copyWith(status: MateriStatus.loading));
    try {
      // Unlock materi berikutnya
      await repository.unlockNextMateri(event.userId, event.currentMateriId);
      
      // Ambil progress terbaru
      final updatedProgress = await repository.getProgress(event.userId);
      
      emit(state.copyWith(
        progress: updatedProgress,
        status: MateriStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        status: MateriStatus.failure,
      ));
    }
  }
  
  Future<void> _onCheckMateriUnlock(
    CheckMateriUnlock event,
    Emitter<MateriState> emit,
  ) async {
    try {
      final progress = state.progress ?? await repository.getProgress(event.userId);
      
      final status = unlockLogic.getStatus(
        materiId: event.materiId,
        currentMateri: progress.currentMateri,
        completedMateri: progress.completedMateri,
      );
      
      emit(state.copyWith(
        currentUnlockStatus: MateriUnlockStatus(
          isUnlocked: status != MateriNodeStatus.locked,
          isCompleted: status == MateriNodeStatus.completed,
        ),
        status: MateriStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        status: MateriStatus.failure,
      ));
    }
  }
  
  Future<void> _onResetProgress(
    ResetMateriProgress event,
    Emitter<MateriState> emit,
  ) async {
    emit(state.copyWith(status: MateriStatus.loading));
    try {
      await repository.resetProgress(event.userId);
      
      final resetProgress = await repository.getProgress(event.userId);
      
      emit(state.copyWith(
        progress: resetProgress,
        status: MateriStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        status: MateriStatus.failure,
      ));
    }
  }
}