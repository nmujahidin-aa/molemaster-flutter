part of 'progress_bloc.dart';

enum ProgressStatus { initial, loading, success, failure }

class ProgressState extends Equatable {
  const ProgressState({
    required this.status,
    this.progress,
    this.message,
  });

  const ProgressState.initial() : this(status: ProgressStatus.initial);

  final ProgressStatus status;
  final Progress? progress;
  final String? message;

  ProgressState copyWith({ProgressStatus? status, Progress? progress, String? message}) {
    return ProgressState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, progress, message];
}