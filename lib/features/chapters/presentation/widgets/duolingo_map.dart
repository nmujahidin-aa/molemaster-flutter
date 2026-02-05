import 'package:flutter/material.dart';
import 'map_painter.dart';

enum NodeState { locked, unlocked, completed }

class DuolingoMap extends StatelessWidget {
  const DuolingoMap({
    super.key,
    required this.total,
    required this.currentMateri,
    required this.completed,
    required this.onTapMateri,
  });

  final int total;
  final int currentMateri;
  final Set<int> completed;
  final void Function(int materiId) onTapMateri;

  @override
  Widget build(BuildContext context) {
    final points = List.generate(total, (i) {
      final isLeft = i.isEven;
      final dx = isLeft ? 70.0 : 250.0;
      final dy = 120.0 * i;
      return Offset(dx, dy);
    });

    return SizedBox(
      height: 120.0 * (total - 1) + 160,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: MapPainter(points: points))),
          for (int i = 0; i < total; i++)
            _Node(
              index: i + 1,
              offset: points[i],
              state: completed.contains(i + 1)
                  ? NodeState.completed
                  : ((i + 1) <= currentMateri ? NodeState.unlocked : NodeState.locked),
              onTap: () => onTapMateri(i + 1),
            ),
        ],
      ),
    );
  }
}

class _Node extends StatelessWidget {
  const _Node({
    required this.index,
    required this.offset,
    required this.state,
    required this.onTap,
  });

  final int index;
  final Offset offset;
  final NodeState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final isLocked = state == NodeState.locked;

    final bg = switch (state) {
      NodeState.locked => Colors.grey.shade400,
      NodeState.unlocked => primary,
      NodeState.completed => primary,
    };

    return Positioned(
      left: offset.dx - 30,
      top: offset.dy,
      child: InkWell(
        onTap: isLocked ? null : onTap,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Center(
            child: state == NodeState.completed
                ? const Icon(Icons.check, color: Colors.white, size: 26)
                : Text(
                    '$index',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
                  ),
          ),
        ),
      ),
    );
  }
}