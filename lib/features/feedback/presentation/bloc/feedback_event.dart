part of 'feedback_bloc.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();
  @override
  List<Object?> get props => [];
}

class FeedbackSubmitRequested extends FeedbackEvent {
  const FeedbackSubmitRequested({required this.userId, required this.title, required this.message});
  final String userId;
  final String title;
  final String message;

  @override
  List<Object?> get props => [userId, title, message];
}