// widgets/paragraph_block_partial_widget.dart
import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'inline_math/rich_inline_math_text_widget.dart';

class ParagraphBlockPartialWidget extends StatelessWidget {
  final ParagraphBlockPartial block;
  final Color primaryColor;
  
  const ParagraphBlockPartialWidget({
    super.key,
    required this.block,
    required this.primaryColor,
  });
  
  @override
  Widget build(BuildContext context) {
    final textWidget = RichInlineMathText(
      spans: block.spans,
      baseStyle: const TextStyle(
        height: 1.55,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 32, 32, 32),
      ),
      textAlign: TextAlign.justify,
    );
    
    return Padding(
      padding: EdgeInsets.only(left: block.indent),
      child: block.highlight
          ? Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor.withOpacity(0.20)),
              ),
              child: textWidget,
            )
          : textWidget,
    );
  }
}