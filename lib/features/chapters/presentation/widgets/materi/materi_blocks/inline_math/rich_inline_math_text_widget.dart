// widgets/rich_inline_math_text.dart
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'inline_math_widget.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class RichInlineMathText extends StatelessWidget {
  final List<CustomTextSpan> spans;
  final TextStyle baseStyle;
  final TextAlign textAlign;
  
  const RichInlineMathText({
    super.key,
    required this.spans,
    required this.baseStyle,
    required this.textAlign,
  });
  
  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> allSpans = [];
    
    for (var span in spans) {
      final textStyle = baseStyle.merge(
        TextStyle(
          fontWeight: span.isBold ? FontWeight.w800 : FontWeight.w400,
        ),
      );
      
      _parseTextWithMath(span.text, textStyle, allSpans);
    }
    
    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: allSpans,
      ),
      textAlign: textAlign,
    );
  }
  
  void _parseTextWithMath(String text, TextStyle style, List<InlineSpan> output) {
    final mathPattern = RegExp(r'\$(.*?)\$');
    String remainingText = text;
    int lastIndex = 0;
    
    for (final match in mathPattern.allMatches(text)) {
      if (match.start > lastIndex) {
        output.add(
          TextSpan(
            text: remainingText.substring(lastIndex, match.start),
            style: style,
          ),
        );
      }
      
      final mathContent = match.group(1)!;
      output.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InlineMathWidget(
              math: mathContent,
              style: style,
            ),
          ),
        ),
      );
      
      lastIndex = match.end;
    }
    
    if (lastIndex < text.length) {
      output.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: style,
        ),
      );
    }
  }
}