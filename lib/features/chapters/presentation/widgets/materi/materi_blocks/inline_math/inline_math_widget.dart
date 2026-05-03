import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class InlineMathWidget extends StatelessWidget {
  final String math;
  final TextStyle? style;
  
  const InlineMathWidget({
    super.key,
    required this.math,
    this.style,
  });
  
  @override
  Widget build(BuildContext context) {
    return Math.tex(
      math,
      textStyle: style,
      mathStyle: MathStyle.text,
    );
  }
}