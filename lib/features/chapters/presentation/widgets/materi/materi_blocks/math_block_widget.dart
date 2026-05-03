import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class MathBlockWidget extends StatelessWidget {
  final MathBlock block;
  
  const MathBlockWidget({
    super.key,
    required this.block,
  });
  
  @override
  Widget build(BuildContext context) {
    final math = Math.tex(
      block.tex,
      mathStyle: MathStyle.display,
      textStyle: const TextStyle(fontSize: 18),
    );
    
    if (block.highlight) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.green.shade700.withOpacity(0.35)),
          ),
          child: math,
        ),
      );
    }
    
    return Center(child: math);
  }
}