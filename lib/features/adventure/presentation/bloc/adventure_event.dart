part of 'adventure_bloc.dart';

sealed class AdventureEvent extends Equatable {
  const AdventureEvent();
  @override
  List<Object?> get props => [];
}

class AdventureStarted extends AdventureEvent {
  const AdventureStarted();
}

class AdventureOptionSelected extends AdventureEvent {
  const AdventureOptionSelected(this.option);
  final String option;

  @override
  List<Object?> get props => [option];
}

class AdventureNextRequested extends AdventureEvent {
  const AdventureNextRequested();
}

class AdventureRestartRequested extends AdventureEvent {
  const AdventureRestartRequested();
}