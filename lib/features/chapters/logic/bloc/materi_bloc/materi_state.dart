// logic/bloc/materi_bloc/materi_state.dart
import 'package:equatable/equatable.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_progress.dart';

enum MateriStatus { initial, loading, success, failure }

class MateriUnlockStatus extends Equatable {
  final bool isUnlocked;
  final bool isCompleted;
  
  const MateriUnlockStatus({
    required this.isUnlocked,
    required this.isCompleted,
  });
  
  @override
  List<Object?> get props => [isUnlocked, isCompleted];
}

class MateriState extends Equatable {
  final MateriProgress? progress;
  final MateriStatus status;
  final String? error;
  final MateriUnlockStatus? currentUnlockStatus;
  
  const MateriState({
    this.progress,
    this.status = MateriStatus.initial,
    this.error,
    this.currentUnlockStatus,
  });
  
  factory MateriState.initial() => const MateriState();
  
  MateriState copyWith({
    MateriProgress? progress,
    MateriStatus? status,
    String? error,
    MateriUnlockStatus? currentUnlockStatus,
  }) {
    return MateriState(
      progress: progress ?? this.progress,
      status: status ?? this.status,
      error: error ?? this.error,
      currentUnlockStatus: currentUnlockStatus ?? this.currentUnlockStatus,
    );
  }
  
  @override
  List<Object?> get props => [progress, status, error, currentUnlockStatus];
}