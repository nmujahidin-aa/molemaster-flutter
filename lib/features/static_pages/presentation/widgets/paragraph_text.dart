import 'package:flutter/material.dart';

class ParagraphText extends StatelessWidget {
  final String text;

  const ParagraphText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.justify, style: const TextStyle(height: 1.4)
    );
  }
}