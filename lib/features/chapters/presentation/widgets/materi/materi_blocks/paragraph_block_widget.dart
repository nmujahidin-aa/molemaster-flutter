import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/inline_math/inline_math_text_widget.dart';

class ParagraphBlockWidget extends StatelessWidget {
  final ParagraphBlock block;
  final Color primaryColor;
  
  const ParagraphBlockWidget({
    super.key,
    required this.block,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
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
              child: InlineMathText(
                text: block.text,
                style: TextStyle(
                  height: 1.55,
                  fontWeight: block.isBold ? FontWeight.w800 : FontWeight.w400,
                  color: Colors.grey.shade900,
                ),
                align: TextAlign.justify,
              ),
            )
          : InlineMathText(
              text: block.text,
              style: TextStyle(
                height: 1.55,
                fontWeight: block.isBold ? FontWeight.w800 : FontWeight.w400,
                color: Colors.grey.shade900,
              ),
              align: TextAlign.justify,
            ),
    );
  }
}
