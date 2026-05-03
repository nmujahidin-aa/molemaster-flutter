import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/bullet_list_block.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/heading_block_widget.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/image_block_widget.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/math_block_widget.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/paragraph_block_partial_widget.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/paragraph_block_widget.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/table_block_widget.dart';
import '../../../domain/entities/materi_block.dart';

class MateriRenderer extends StatelessWidget {
  final List<MateriBlock> blocks;
  final Color primaryColor;
  
  const MateriRenderer({
    super.key,
    required this.blocks,
    required this.primaryColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: blocks.map((block) => _buildBlock(block, context)).toList(),
    );
  }
  
  Widget _buildBlock(MateriBlock block, BuildContext context) {
    switch (block) {
      case HeadingBlock():
        return HeadingBlockWidget(block: block);
      case ParagraphBlock():
        return ParagraphBlockWidget(
          block: block,
          primaryColor: primaryColor,
        );
      case ParagraphBlockPartial():
        return ParagraphBlockPartialWidget(
          block: block,
          primaryColor: primaryColor,
        );
      case ImageBlock():
        return ImageBlockWidget(block: block);
      case MathBlock():
        return MathBlockWidget(block: block);
      case BulletListBlock():
        return BulletListBlockWidget(
          block: block,
          primaryColor: primaryColor,
        );
      case TableBlock():
        return TableBlockWidget(block: block);
      default:
        return const SizedBox.shrink();
    }
  }
}