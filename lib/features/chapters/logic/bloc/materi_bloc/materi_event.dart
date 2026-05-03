// logic/bloc/materi_bloc/materi_event.dart
import 'package:equatable/equatable.dart';

abstract class MateriEvent extends Equatable {
  const MateriEvent();
  
  @override
  List<Object?> get props => [];
}

class LoadMateriProgress extends MateriEvent {
  final String userId;
  
  const LoadMateriProgress(this.userId);
  
  @override
  List<Object?> get props => [userId];
}

class CompleteMateri extends MateriEvent {
  final String userId;
  final int materiId;
  
  const CompleteMateri({
    required this.userId,
    required this.materiId,
  });
  
  @override
  List<Object?> get props => [userId, materiId];
}

class UnlockNextMateri extends MateriEvent {
  final String userId;
  final int currentMateriId;
  
  const UnlockNextMateri({
    required this.userId,
    required this.currentMateriId,
  });
  
  @override
  List<Object?> get props => [userId, currentMateriId];
}

class CheckMateriUnlock extends MateriEvent {
  final String userId;
  final int materiId;
  
  const CheckMateriUnlock({
    required this.userId,
    required this.materiId,
  });
  
  @override
  List<Object?> get props => [userId, materiId];
}

class ResetMateriProgress extends MateriEvent {
  final String userId;
  
  const ResetMateriProgress(this.userId);
  
  @override
  List<Object?> get props => [userId];
}