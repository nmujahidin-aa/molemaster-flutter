import 'package:cloud_firestore/cloud_firestore.dart';

class MateriProgress {
  final String userId;
  final int currentMateri;
  final Set<int> completedMateri;
  final DateTime? lastUpdated;
  
  const MateriProgress({
    required this.userId,
    required this.currentMateri,
    required this.completedMateri,
    this.lastUpdated,
  });
  
  factory MateriProgress.fromFirestore(
    Map<String, dynamic> data, 
    {required String userId}
  ) {
    return MateriProgress(
      userId: userId,  // Dari parameter, bukan dari Firestore
      currentMateri: data['current_materi'] ?? 1,
      completedMateri: Set<int>.from(data['completed_materi'] ?? []),
      lastUpdated: (data['last_updated'] as Timestamp?)?.toDate(),
    );
  }
  
  Map<String, dynamic> toFirestore() {
    return {
      'current_materi': currentMateri,
      'completed_materi': completedMateri.toList(),
      'last_updated': FieldValue.serverTimestamp(),
    };
  }
}