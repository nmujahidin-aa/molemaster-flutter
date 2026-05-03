import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/inline_math/inline_math_text_widget.dart';

class BulletListBlockWidget extends StatelessWidget {
  final BulletListBlock block;
  final Color primaryColor;
  
  const BulletListBlockWidget({
    super.key,
    required this.block,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: block.indent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: block.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom bullet widget
                _buildBullet(index),
                const SizedBox(width: 8),
                // Text content with partial bold support
                Expanded(
                  child: _buildListItemContent(item),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  
  Widget _buildBullet(int index) {
    // Custom bullet berdasarkan tipe atau level
    switch (block.bulletType) {
      case BulletType.disc:
        return const Text('•  ', style: TextStyle(height: 1.55, fontSize: 16));
      case BulletType.circle:
        return const Text('○  ', style: TextStyle(height: 1.55, fontSize: 16));
      case BulletType.square:
        return const Text('▪  ', style: TextStyle(height: 1.55, fontSize: 16));
      case BulletType.number:
        return Text(
          '${index + 1}.  ',
          style: const TextStyle(height: 1.55, fontWeight: FontWeight.w500),
        );
      case BulletType.roman:
        return Text(
          '${_toRoman(index + 1)}.  ',
          style: const TextStyle(height: 1.55, fontWeight: FontWeight.w500),
        );
      case BulletType.letter:
        return Text(
          '${String.fromCharCode(65 + index)}.  ',
          style: const TextStyle(height: 1.55, fontWeight: FontWeight.w500),
        );
      case BulletType.custom:
        return Text(
          '${block.customBullet ?? '•'}  ',
          style: const TextStyle(height: 1.55, fontSize: 16),
        );
      default:
        return const Text('•  ', style: TextStyle(height: 1.55, fontSize: 16));
    }
  }
  
  Widget _buildListItemContent(String item) {
    // Cek apakah item mengandung marker bold **text**
    if (item.contains('**') && block.enablePartialBold) {
      return _buildRichTextWithBold(item);
    }
    
    // Fallback ke InlineMathText biasa
    return InlineMathText(
      text: item,
      style: const TextStyle(height: 1.55, color: Colors.black87),
      align: TextAlign.start,
    );
  }
  
  Widget _buildRichTextWithBold(String text) {
    final List<TextSpan> spans = [];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int lastIndex = 0;
    
    for (final match in regex.allMatches(text)) {
      // Add normal text before bold
      if (match.start > lastIndex) {
        final normalText = text.substring(lastIndex, match.start);
        spans.add(
          TextSpan(
            text: normalText,
            style: const TextStyle(height: 1.55, color: Colors.black87),
          ),
        );
      }
      
      // Add bold text
      final boldText = match.group(1)!;
      spans.add(
        TextSpan(
          text: boldText,
          style: const TextStyle(
            height: 1.55,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      
      lastIndex = match.end;
    }
    
    // Add remaining normal text
    if (lastIndex < text.length) {
      final remainingText = text.substring(lastIndex);
      spans.add(
        TextSpan(
          text: remainingText,
          style: const TextStyle(height: 1.55, color: Colors.black87),
        ),
      );
    }
    
    return RichText(
      text: TextSpan(children: spans),
      textAlign: TextAlign.start,
    );
  }
  
  String _toRoman(int number) {
    if (number <= 0) return '';
    const romanNumerals = {
      1000: 'M', 900: 'CM', 500: 'D', 400: 'CD',
      100: 'C', 90: 'XC', 50: 'L', 40: 'XL',
      10: 'X', 9: 'IX', 5: 'V', 4: 'IV', 1: 'I'
    };
    var result = '';
    var remaining = number;
    for (final entry in romanNumerals.entries) {
      while (remaining >= entry.key) {
        result += entry.value;
        remaining -= entry.key;
      }
    }
    return result;
  }
}

// Enum untuk tipe bullet
enum BulletType {
  disc,
  circle,
  square,
  number,
  roman,
  letter,
  custom,
}