part of 'feedback_bloc.dart';

enum FeedbackStatus { initial, loading, success, failure }

class FeedbackState extends Equatable {
  const FeedbackState({required this.status, this.message});
  const FeedbackState.initial() : this(status: FeedbackStatus.initial);
  const FeedbackState.loading() : this(status: FeedbackStatus.loading);
  const FeedbackState.success() : this(status: FeedbackStatus.success);
  const FeedbackState.failure(String msg) : this(status: FeedbackStatus.failure, message: msg);

  final FeedbackStatus status;
  final String? message;

  @override
  List<Object?> get props => [status, message];
}