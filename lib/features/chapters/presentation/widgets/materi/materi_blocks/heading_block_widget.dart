import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class HeadingBlockWidget extends StatelessWidget {
  final HeadingBlock block;
  
  final Color? color;
  final EdgeInsets? margin;
  
  const HeadingBlockWidget({
    super.key,
    required this.block,
    this.color,
    this.margin,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final baseStyle = switch (block.level) {
      1 => theme.textTheme.titleLarge,
      2 => theme.textTheme.titleMedium,
      _ => theme.textTheme.titleSmall,
    };
    
    final style = baseStyle?.copyWith(
      fontWeight: switch (block.level) {
        1 => FontWeight.w900,
        2 => FontWeight.w900,
        _ => FontWeight.w800,
      },
      color: color,
    );
    
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        block.text,
        style: style,
      ),
    );
  }
}