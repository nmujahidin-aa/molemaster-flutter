import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class InlineMathText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final bool enableBold;
  
  const InlineMathText({
    super.key,
    required this.text,
    required this.style,
    this.align = TextAlign.start,
    this.enableBold = true,
  });
  
  @override
  Widget build(BuildContext context) {
    if (enableBold && text.contains('**')) {
      return _buildRichTextWithBoldAndMath();
    }
    
    return _buildMathOnly();
  }
  
  Widget _buildRichTextWithBoldAndMath() {
    final spans = <InlineSpan>[];
    
    final boldPattern = RegExp(r'\*\*(.*?)\*\*');
    int lastIndex = 0;
    
    for (final match in boldPattern.allMatches(text)) {
      if (match.start > lastIndex) {
        final beforeText = text.substring(lastIndex, match.start);
        spans.addAll(_parseMath(beforeText, style));
      }
      
      final boldText = match.group(1)!;
      final boldStyle = style.copyWith(fontWeight: FontWeight.bold);
      spans.addAll(_parseMath(boldText, boldStyle));
      
      lastIndex = match.end;
    }
    
    if (lastIndex < text.length) {
      final afterText = text.substring(lastIndex);
      spans.addAll(_parseMath(afterText, style));
    }
    
    return RichText(
      textAlign: align,
      text: TextSpan(children: spans),
    );
  }
  
  Widget _buildMathOnly() {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'\$(.+?)\$', dotAll: true);
    
    int last = 0;
    for (final m in regex.allMatches(text)) {
      if (m.start > last) {
        spans.add(TextSpan(
          text: text.substring(last, m.start),
          style: style,
        ));
      }
      
      final tex = m.group(1) ?? '';
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Math.tex(
              tex,
              mathStyle: MathStyle.text,
              textStyle: style.copyWith(
                fontSize: (style.fontSize ?? 14) + 1,
              ),
            ),
          ),
        ),
      );
      
      last = m.end;
    }
    
    if (last < text.length) {
      spans.add(TextSpan(
        text: text.substring(last),
        style: style,
      ));
    }
    
    return RichText(
      textAlign: align,
      text: TextSpan(children: spans),
    );
  }
  
  List<InlineSpan> _parseMath(String text, TextStyle textStyle) {
    final List<InlineSpan> spans = [];
    final mathPattern = RegExp(r'\$(.*?)\$');
    
    int lastIndex = 0;
    for (final match in mathPattern.allMatches(text)) {
      // Teks biasa sebelum math
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: textStyle,
        ));
      }
      
      // Teks math
      final mathContent = match.group(1)!;
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Math.tex(
              mathContent,
              mathStyle: MathStyle.text,
              textStyle: textStyle.copyWith(
                fontSize: (textStyle.fontSize ?? 14),
              ),
            ),
          ),
        ),
      );
      
      lastIndex = match.end;
    }
    
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: textStyle,
      ));
    }
    
    return spans;
  }
}