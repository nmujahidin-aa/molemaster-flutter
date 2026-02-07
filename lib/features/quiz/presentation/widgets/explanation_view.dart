import 'package:flutter/material.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';

class ExplanationView extends StatelessWidget {
  const ExplanationView({
    super.key,
    required this.explanation,
  });

  final String explanation;

  @override
  Widget build(BuildContext context) {
    // Split by $$ ... $$ blocks
    final parts = _splitByMathBlock(explanation);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final p in parts) ...[
          if (p.isMath)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Math.tex(
                  p.value,
                  textStyle: const TextStyle(fontSize: 16),
                  mathStyle: MathStyle.display,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                p.value,
                style: TextStyle(color: Colors.grey.shade800, height: 1.45),
              ),
            )
        ],
      ],
    );
  }

  List<_Part> _splitByMathBlock(String input) {
    // Supports multiple $$ ... $$ blocks
    final regex = RegExp(r'\$\$(.*?)\$\$', dotAll: true);
    final matches = regex.allMatches(input).toList();
    if (matches.isEmpty) return [ _Part.text(input.trim()) ];

    final result = <_Part>[];
    int last = 0;

    for (final m in matches) {
      final start = m.start;
      final end = m.end;

      // text before math
      if (start > last) {
        final t = input.substring(last, start).trim();
        if (t.isNotEmpty) result.add(_Part.text(t));
      }

      // math content inside $$
      final mathContent = (m.group(1) ?? '').trim();
      if (mathContent.isNotEmpty) result.add(_Part.math(mathContent));

      last = end;
    }

    // remaining text
    if (last < input.length) {
      final t = input.substring(last).trim();
      if (t.isNotEmpty) result.add(_Part.text(t));
    }

    return result;
  }
}

class _Part {
  const _Part._(this.value, this.isMath);
  final String value;
  final bool isMath;

  factory _Part.text(String v) => _Part._(v, false);
  factory _Part.math(String v) => _Part._(v, true);
}