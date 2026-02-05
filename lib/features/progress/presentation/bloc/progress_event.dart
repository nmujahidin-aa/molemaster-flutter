part of 'progress_bloc.dart';

abstract class ProgressEvent extends Equatable {
  const ProgressEvent();
  @override
  List<Object?> get props => [];
}

class ProgressLoadRequested extends ProgressEvent {
  const ProgressLoadRequested({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}

class ProgressMarkCompletedRequested extends ProgressEvent {
  const ProgressMarkCompletedRequested({required this.userId, required this.materiId});
  final String userId;
  final int materiId;

  @override
  List<Object?> get props => [userId, materiId];
}