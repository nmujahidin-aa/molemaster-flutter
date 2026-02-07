import '../../domain/entities/progress.dart';

class ProgressModel extends Progress {
  const ProgressModel({
    required super.userId,
    required super.currentMateri,
    required super.completedMateri,
    super.trainingBestScore,
  });

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'current_materi': currentMateri,
        'completed_materi': completedMateri,
        'training_best_score': trainingBestScore,
      };

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
      userId: json['user_id'] as String,
      currentMateri: (json['current_materi'] as num?)?.toInt() ?? 1,
      completedMateri: (json['completed_materi'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          <int>[],
      trainingBestScore: (json['training_best_score'] as num?)?.toInt(),
    );
  }
}