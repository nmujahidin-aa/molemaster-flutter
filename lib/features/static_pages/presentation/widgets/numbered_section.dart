import 'package:flutter/material.dart';
import 'numbered_text.dart';
import 'bullet_text.dart';

class NumberedSection extends StatelessWidget {
  final int number;
  final String title;
  final List<String> bullets;

  const NumberedSection({
    super.key,
    required this.number,
    required this.title,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NumberedText(number, title),
        const SizedBox(height: 4),
        ...bullets.map((b) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BulletText(b),
            )).toList(),
        const SizedBox(height: 8),
      ],
    );
  }
}