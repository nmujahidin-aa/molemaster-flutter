import 'package:flutter/material.dart';
import 'mole_bubble.dart';

enum MoleNodeState {
  locked,  
  unlocked,  
  completed, 
}

class MoleMateriMeta {
  const MoleMateriMeta({
    required this.id,
    required this.title,
    required this.icon,
  });

  final int id;
  final String title;
  final IconData icon;
}

class MoleNode extends StatelessWidget {
  const MoleNode({
    super.key,
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

    return Positioned(
      left: offset.dx - 38,
      top: offset.dy,
      child: Column(
        children: [
          if (showStartBubble) ...[
            StartBubble(
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
                      color: isUnlocked || isCompleted
                          ? primary.withOpacity(0.20)
                          : Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
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
                        ),
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