part of 'adventure_bloc.dart';

enum AdventureStatus { initial, loading, playing, finished }

class AdventureState extends Equatable {
  const AdventureState({
    required this.status,
    this.questions = const [],
    this.index = 0,
    this.hearts = 3,
    this.stars = 0,
    this.streak = 0,
    this.isAnswered = false,
    this.selected,
    this.lastCorrect,
    this.lastGainedStars = 0,
    this.showCombo = false,
  });

  const AdventureState.initial() : this(status: AdventureStatus.initial);
  const AdventureState.loading() : this(status: AdventureStatus.loading);

  const AdventureState.playing({
    required List<Question> questions,
    required int index,
    required int hearts,
    required int stars,
    required int streak,
  }) : this(
          status: AdventureStatus.playing,
          questions: questions,
          index: index,
          hearts: hearts,
          stars: stars,
          streak: streak,
        );

  final AdventureStatus status;
  final List<Question> questions;
  final int index;
  final int hearts;
  final int stars;
  final int streak;

  final bool isAnswered;
  final String? selected;
  final bool? lastCorrect;
  final int lastGainedStars;
  final bool showCombo;

  bool get isPlaying => status == AdventureStatus.playing;
  Question? get currentQuestion => questions.isEmpty ? null : questions[index];

  AdventureState copyWith({
    AdventureStatus? status,
    List<Question>? questions,
    int? index,
    int? hearts,
    int? stars,
    int? streak,
    bool? isAnswered,
    String? selected,
    bool? lastCorrect,
    int? lastGainedStars,
    bool? showCombo,
  }) {
    return AdventureState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      index: index ?? this.index,
      hearts: hearts ?? this.hearts,
      stars: stars ?? this.stars,
      streak: streak ?? this.streak,
      isAnswered: isAnswered ?? this.isAnswered,
      selected: selected,
      lastCorrect: lastCorrect,
      lastGainedStars: lastGainedStars ?? this.lastGainedStars,
      showCombo: showCombo ?? this.showCombo,
    );
  }

  @override
  List<Object?> get props => [
        status, questions, index, hearts, stars, streak,
        isAnswered, selected, lastCorrect, lastGainedStars, showCombo
      ];
}