import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/bullet_list_block.dart';

sealed class MateriBlock {
  const MateriBlock();
}

class HeadingBlock extends MateriBlock {
  const HeadingBlock(this.text, {this.level = 1});
  final String text;
  final int level; // 1,2,3
}

class ParagraphBlock extends MateriBlock {
  const ParagraphBlock(
    this.text, {
    this.indent = 0,
    this.isBold = false,
    this.highlight = false,
  });

  final String text;

  final double indent;

  final bool isBold;

  final bool highlight;
}

class ParagraphBlockPartial extends MateriBlock {
  const ParagraphBlockPartial(
    this.spans, {
    this.indent = 0,
    this.highlight = false,
  });

  final List<CustomTextSpan> spans; 
  final double indent;
  final bool highlight;
}

class CustomTextSpan {
  final String text;
  final bool isBold;
  
  const CustomTextSpan(this.text, {this.isBold = false});
}


class BulletListBlock extends MateriBlock {
  final List<String> items;
  final double indent;
  final BulletType bulletType; 
  final String? customBullet;     
  final bool enablePartialBold;    
  
  const BulletListBlock(
    this.items, {
    this.indent = 0,
    this.bulletType = BulletType.disc, 
    this.customBullet,
    this.enablePartialBold = true,     
  });
}

class MathBlock extends MateriBlock {
  const MathBlock(this.tex, {this.highlight = false});
  final String tex; // pure TeX
  final bool highlight;
}

class ImageBlock extends MateriBlock {
  const ImageBlock({
    required this.assetPath,
    this.width,
    this.caption,
    this.border = true,
  });

  final String assetPath;
  final double? width;
  final String? caption;
  final bool border;
}

class TableBlock extends MateriBlock {
  const TableBlock({
    required this.headers,
    required this.rows,
  });

  final List<String> headers;
  final List<List<String>> rows; // each cell supports inline math $...$
}