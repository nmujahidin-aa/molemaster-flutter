import 'package:flutter/material.dart';

class HintAlertCard extends StatelessWidget {
  const HintAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: primary.withOpacity(0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_rounded, color: primary),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Node biru = bisa dipelajari\nNode abu-abu = terkunci',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -8,
          left: 24,
          child: Transform.rotate(
            angle: 3.14 / 4,
            child: Container(
              width: 16,
              height: 16,
              color: primary.withOpacity(0.08),
            ),
          ),
        ),
      ],
    );
  }
}