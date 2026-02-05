import 'package:equatable/equatable.dart';

class Progress extends Equatable {
  const Progress({
    required this.userId,
    required this.currentMateri,
    required this.completedMateri,
  });

  final String userId;
  final int currentMateri; // 1..7
  final List<int> completedMateri;

  bool get allChaptersCompleted => completedMateri.toSet().length >= 7;

  @override
  List<Object?> get props => [userId, currentMateri, completedMateri];
}