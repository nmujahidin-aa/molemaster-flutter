import 'dart:math' as math;
import 'package:flutter/material.dart';

enum MoleNodeState { locked, unlocked, completed }

class MoleMateriMeta {
  const MoleMateriMeta({
    required this.id,
    required this.title,
    required this.icon,
  });

  final int id; // 1..7
  final String title;
  final IconData icon;
}

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

  MoleNodeState _stateFor(int materiId) {
    if (completed.contains(materiId)) return MoleNodeState.completed;
    if (materiId <= currentMateri) return MoleNodeState.unlocked;
    return MoleNodeState.locked;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, c) {
        final w = c.maxWidth;
        final centerX = w / 2;

        // Pola kelokan seperti path duolingo:
        // x = center + sin(i) * amplitude
        final amplitude = math.min(120.0, w * 0.22); // adaptif
        const spacingY = 120.0;
        const topPadding = 16.0;

        final total = materi.length;
        final height = topPadding + (total - 1) * spacingY + 180;

        Offset pointForIndex(int i) {
          final t = i.toDouble();
          final x = centerX + math.sin(t * 1.15) * amplitude; // kelok halus
          final y = topPadding + t * spacingY;
          return Offset(x, y);
        }

        return SizedBox(
          height: height,
          child: Stack(
            children: [
              for (int i = 0; i < total; i++)
                _MoleNode(
                  offset: pointForIndex(i),
                  meta: materi[i],
                  state: _stateFor(materi[i].id),
                  showStartBubble: materi[i].id == 1 && _stateFor(1) != MoleNodeState.locked,
                  onTap: () => _showMateriSheet(context, materi[i], _stateFor(materi[i].id)),
                  onStart: () => onStartMateri(materi[i].id),
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMateriSheet(BuildContext context, MoleMateriMeta meta, MoleNodeState state) async {
    final isLocked = state == MoleNodeState.locked;
    final isCompleted = state == MoleNodeState.completed;

    final statusText = switch (state) {
      MoleNodeState.locked => 'TERKUNCI',
      MoleNodeState.unlocked => 'TERBUKA',
      MoleNodeState.completed => 'SELESAI',
    };

    final subtitle = switch (state) {
      MoleNodeState.locked => 'Selesaikan materi sebelumnya untuk membuka materi ini.',
      MoleNodeState.unlocked => 'Materi ini siap dipelajari. Baca materi lalu kerjakan Post Test.',
      MoleNodeState.completed => 'Materi sudah kamu selesaikan. Kamu boleh mengulang kapan saja.',
    };

    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (_) {
        final primary = Theme.of(context).colorScheme.primary;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header row
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: isLocked ? Colors.grey.shade200 : primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(meta.icon, color: isLocked ? Colors.grey.shade500 : primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meta.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(
                          statusText,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
                            color: isLocked ? Colors.grey.shade500 : primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(subtitle, style: TextStyle(color: Colors.grey.shade700, height: 1.35)),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isLocked
                      ? null
                      : () {
                          Navigator.pop(context);
                          onStartMateri(meta.id);
                        },
                  style: FilledButton.styleFrom(
                    backgroundColor: isLocked ? Colors.grey.shade300 : null,
                    foregroundColor: isLocked ? Colors.grey.shade600 : null,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(isLocked ? 'TERKUNCI' : (isCompleted ? 'ULANGI' : 'MULAI')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MoleNode extends StatelessWidget {
  const _MoleNode({
    required this.offset,
    required this.meta,
    required this.state,
    required this.onTap,
    required this.onStart,
    required this.showStartBubble,
  });

  final Offset offset;
  final MoleMateriMeta meta;
  final MoleNodeState state;
  final VoidCallback onTap;
  final VoidCallback onStart;
  final bool showStartBubble;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    final isLocked = state == MoleNodeState.locked;
    final isCompleted = state == MoleNodeState.completed;
    final isUnlocked = state == MoleNodeState.unlocked;

    final baseColor = isLocked ? Colors.grey.shade300 : primary;
    final iconColor = isLocked ? Colors.grey.shade500 : Colors.white;

    // efek "3D": layer bayangan bawah + circle utama
    return Positioned(
      left: offset.dx - 38,
      top: offset.dy,
      child: Column(
        children: [
          if (showStartBubble) ...[
            _StartBubble(
              label: 'MULAI',
              color: primary,
              onTap: isLocked ? null : onStart,
            ),
            const SizedBox(height: 10),
          ],
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
              width: 76,
              height: 76,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: isUnlocked || isCompleted ? primary.withOpacity(0.20) : Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
                  // main circle
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: baseColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Center(
                      child: isCompleted
                          ? const Icon(Icons.check, color: Colors.white, size: 26)
                          : Icon(meta.icon, color: iconColor, size: 26),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StartBubble extends StatelessWidget {
  const _StartBubble({required this.label, required this.color, required this.onTap});
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.25)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 6)),
                ],
              ),
              child: Text(
                label,
                style: TextStyle(color: color, fontWeight: FontWeight.w900, letterSpacing: 1),
              ),
            ),
            CustomPaint(
              size: const Size(14, 8),
              painter: _BubbleTailPainter(color: Colors.white, borderColor: color.withOpacity(0.25)),
            ),
          ],
        ),
      ),
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  _BubbleTailPainter({required this.color, required this.borderColor});
  final Color color;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = color..style = PaintingStyle.fill;
    final stroke = Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}