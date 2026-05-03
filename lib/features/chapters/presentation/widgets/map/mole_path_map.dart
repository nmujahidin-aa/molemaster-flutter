import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'mole_node.dart';
import 'mole_bubble.dart';

class MolePathMap extends StatelessWidget {
  const MolePathMap({
    super.key,
    required this.materi,
    required this.currentMateri,
    required this.completed,
    required this.onStartMateri,
  });

  final List<MoleMateriMeta> materi;
  final int currentMateri;
  final Set<int> completed;
  final void Function(int materiId) onStartMateri;

  /// Menentukan status node berdasarkan progress user
  MoleNodeState _stateFor(int materiId) {
    if (completed.contains(materiId)) return MoleNodeState.completed;
    if (materiId <= currentMateri) return MoleNodeState.unlocked;
    return MoleNodeState.locked;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        final centerX = width / 2;

        // Pola kelokan seperti path Duolingo:
        // x = center + sin(i) * amplitude
        final amplitude = math.min(120.0, width * 0.22);
        const spacingY = 120.0;
        const topPadding = 16.0;

        final total = materi.length;
        final height = topPadding + (total - 1) * spacingY + 180;

        // Hitung posisi X,Y untuk setiap node
        Offset pointForIndex(int i) {
          final t = i.toDouble();
          final x = centerX + math.sin(t * 1.15) * amplitude;
          final y = topPadding + t * spacingY;
          return Offset(x, y);
        }

        return SizedBox(
          height: height,
          child: Stack(
            children: [
              // Gambar garis penghubung antar node (optional)
              // Bisa ditambahkan CustomPaint untuk menggambar path line
              
              // Node-node materi
              for (int i = 0; i < total; i++)
                MoleNode(
                  offset: pointForIndex(i),
                  meta: materi[i],
                  state: _stateFor(materi[i].id),
                  showStartBubble: materi[i].id == 1 &&
                      _stateFor(1) != MoleNodeState.locked,
                  onTap: () => _showMateriSheet(
                    context,
                    materi[i],
                    _stateFor(materi[i].id),
                  ),
                  onStart: () => onStartMateri(materi[i].id),
                ),
            ],
          ),
        );
      },
    );
  }

  /// Menampilkan bottom sheet detail materi saat node diklik
  Future<void> _showMateriSheet(
    BuildContext context,
    MoleMateriMeta meta,
    MoleNodeState state,
  ) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (_) => MateriDetailSheet(
        meta: meta,
        state: state,
        onStart: () => onStartMateri(meta.id),
      ),
    );
  }
}