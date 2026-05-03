// logic/utils/materi_unlock_logic.dart

class MateriUnlockLogic {
  /// Cek apakah materi terbuka berdasarkan currentMateri dan completed
  ///
  /// [materiId] - ID materi yang dicek (1-7)
  /// [currentMateri] - Materi terakhir yang terbuka/diakses
  /// [completedMateri] - Set materi yang sudah diselesaikan
  ///
  /// Logic:
  /// - Materi 1: SELALU terbuka
  /// - Materi N: terbuka jika currentMateri >= N ATAU materi N-1 sudah completed
  bool isUnlocked({
    required int materiId,
    required int currentMateri,
    required Set<int> completedMateri,
  }) {
    // Materi 1 selalu terbuka
    if (materiId == 1) return true;
    
    // Jika currentMateri sudah mencapai atau melebihi materiId
    if (currentMateri >= materiId) return true;
    
    // Jika materi sebelumnya sudah selesai
    if (completedMateri.contains(materiId - 1)) return true;
    
    return false;
  }
  
  /// Cek apakah materi sudah selesai
  bool isCompleted({
    required int materiId,
    required Set<int> completedMateri,
  }) {
    return completedMateri.contains(materiId);
  }

  MateriNodeStatus getStatus({
    required int materiId,
    required int currentMateri,
    required Set<int> completedMateri,
  }) {
    if (completedMateri.contains(materiId)) {
      return MateriNodeStatus.completed;
    }
    if (isUnlocked(
      materiId: materiId,
      currentMateri: currentMateri,
      completedMateri: completedMateri,
    )) {
      return MateriNodeStatus.unlocked;
    }
    return MateriNodeStatus.locked;
  }
  
  /// Cek apakah materi berikutnya bisa diakses (untuk tombol Next)
  bool canGoToNext({
    required int currentMateriId,
    required int totalMateri,
    required int currentMateri,
    required Set<int> completedMateri,
  }) {
    final nextId = currentMateriId + 1;
    if (nextId > totalMateri) return false;
    
    return completedMateri.contains(currentMateriId) || nextId <= currentMateri;
  }
  
  /// Cek apakah materi sebelumnya bisa diakses (untuk tombol Previous)
  bool canGoToPrevious({
    required int currentMateriId,
  }) {
    return currentMateriId > 1;
  }
  
  /// Dapatkan daftar materi yang terbuka
  List<int> getUnlockedMateri({
    required int totalMateri,
    required int currentMateri,
    required Set<int> completedMateri,
  }) {
    return List.generate(totalMateri, (i) => i + 1)
        .where((id) => isUnlocked(
          materiId: id,
          currentMateri: currentMateri,
          completedMateri: completedMateri,
        ))
        .toList();
  }
  
  /// Dapatkan materi berikutnya yang belum selesai
  int? getNextUncompletedMateri({
    required int currentMateriId,
    required int totalMateri,
    required Set<int> completedMateri,
  }) {
    for (int i = currentMateriId + 1; i <= totalMateri; i++) {
      if (!completedMateri.contains(i)) {
        return i;
      }
    }
    return null;
  }
  
  /// Dapatkan progress persentase (berapa persen materi sudah selesai)
  double getProgressPercentage({
    required int totalMateri,
    required Set<int> completedMateri,
  }) {
    if (totalMateri == 0) return 0.0;
    return completedMateri.length / totalMateri;
  }
}

enum MateriNodeStatus {
  locked,
  unlocked,
  completed,
}