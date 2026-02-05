import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/feedback_repository.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc(this._repo) : super(const FeedbackState.initial()) {
    on<FeedbackSubmitRequested>(_onSubmit);
  }

  final FeedbackRepository _repo;

  Future<void> _onSubmit(FeedbackSubmitRequested e, Emitter<FeedbackState> emit) async {
    try {
      emit(const FeedbackState.loading());
      await _repo.submit(userId: e.userId, title: e.title, message: e.message);
      emit(const FeedbackState.success());
      emit(const FeedbackState.initial());
    } catch (err) {
      emit(FeedbackState.failure(err.toString()));
    }
  }
}