import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.isSelected,
    required this.isCorrectOption,
    required this.showResult,
    required this.onTap,
  });

  final String label; // A..E
  final String text;
  final bool isSelected;
  final bool isCorrectOption;
  final bool showResult;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color border = Colors.transparent;
    Color bg = const Color(0xFFF6F8FC);

    if (showResult) {
      if (isCorrectOption) {
        bg = Colors.green.shade50;
        border = Colors.green.shade600;
      } else if (isSelected && !isCorrectOption) {
        bg = Colors.red.shade50;
        border = Colors.red.shade600;
      }
    } else if (isSelected) {
      bg = Theme.of(context).colorScheme.primary.withOpacity(0.10);
      border = Theme.of(context).colorScheme.primary;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: const TextStyle(height: 1.35))),
          ],
        ),
      ),
    );
  }
}