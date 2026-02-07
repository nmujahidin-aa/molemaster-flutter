import 'package:flutter/material.dart';

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

  /// text supports inline math with $...$
  final String text;

  /// indent in pixels (e.g. 24 for "menjorok")
  final double indent;

  final bool isBold;

  /// highlight paragraph background
  final bool highlight;
}

class BulletListBlock extends MateriBlock {
  const BulletListBlock(this.items, {this.indent = 0});
  final List<String> items; // each item supports inline math $...$
  final double indent;
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