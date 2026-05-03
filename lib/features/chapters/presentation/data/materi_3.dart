import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class MateriBab3 {
  static const List<MateriBlock> blocks = [
    // Heading utama
    HeadingBlock('3. Hubungan Mol ↔ Massa Molar', level: 1),

    // Paragraf pembuka
    ParagraphBlock(
      'Dengan memahami materi sebelumnya, kalian telah mengetahui bahwa nilai massa molar suatu zat sama dengan nilai Ar atau Mr zat tersebut, namun massa molar dinyatakan dalam satuan gram/mol. Bagaimana hubungan mol dengan massa? Mudah sekali, cek rumus di bawah!',
      indent: 0,
    ),

    ParagraphBlock( 
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{Massa zat} = \text{n} \times \text{Massa Molar}',
    ),
    ParagraphBlock( 
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{Massa zat} = \text{n} \times \text{Ar/Mr}',
    ),

    ParagraphBlock( 
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{n} = \frac{\text{massa}}{\text{Ar}} \text{ atau } \text{ n} = \frac{\text{massa}}{\text{Mr}}',
      highlight: true,
    ),

    ParagraphBlock(
      'Contoh:',
      indent: 0,
      isBold: true,
    ),

    // Sub contoh - Menghitung massa dari mol
    ParagraphBlock(
      'Hitunglah massa dari:',
      indent: 12,
      isBold: true,
    ),

    ParagraphBlock(
      'a. 0,75 mol urea CO(NH₂)₂ (Ar C = 12, O = 16, N = 14, dan H = 1)',
      indent: 12,
    ),

    ParagraphBlock(
      'Jawab:',
      indent: 24,
      isBold: true,
    ),

    ParagraphBlock(
      'Hitung Mr CO(NH₂)₂',
      indent: 24,
    ),

    MathBlock(
      r'\text{Mr CO(NH₂)₂} = 12 + 16 + 2(14) + 2(2) = 60',
    ),

    ParagraphBlock(
      'Massa urea = mol × Mr CO(NH₂)₂ = 0,75 mol × 60 = 45 gram',
      indent: 24,
    ),

    ParagraphBlock(
      'b. 0,5 mol O₂ (Ar O = 16)',
      indent: 12,
    ),

    ParagraphBlock(
      'Jawab:',
      indent: 24,
      isBold: true,
    ),

    ParagraphBlock(
      'Hitung Mr O₂',
      indent: 24,
    ),

    MathBlock(
      r'\text{Mr O₂} = 2(16) = 32',
    ),

    ParagraphBlock(
      'Massa O₂ = mol × Mr O₂ = 0,5 mol × 32 = 16 gram',
      indent: 24,
    ),

    ParagraphBlock(
      'Hitunglah banyaknya mol dari:',
      indent: 12,
      isBold: true,
    ),

    ParagraphBlock(
      'a. 2,3 gram natrium (Ar Na = 23)',
      indent: 12,
    ),

    ParagraphBlock(
      'Jawab:',
      indent: 24,
      isBold: true,
    ),

    MathBlock(
      r'\text{mol Na} = \frac{\text{massa}}{\text{Ar}} = \frac{2,3 \text{ gram}}{23} = 0,1 \text{ mol}',
    ),

    ParagraphBlock(
      'b. 45 gram C₆H₁₂O₆ (Ar C = 12, H = 1, dan O = 16)',
      indent: 12,
    ),

    ParagraphBlock(
      'Jawab:',
      indent: 24,
      isBold: true,
    ),

    ParagraphBlock(
      'Hitung Mr C₆H₁₂O₆',
      indent: 24,
    ),

    MathBlock(
      r'\text{Mr C₆H₁₂O₆} = 6(12) + 12(1) + 6(16) = 180',
    ),

    MathBlock(
      r'\text{mol C₆H₁₂O₆} = \frac{\text{massa}}{\text{Mr}} = \frac{45 \text{ gram}}{180} = 0,25 \text{ mol}',
    ),


    ParagraphBlock(
      'Berdasarkan penjelasan mengenai mol, jumlah partikel, massa zat, dan massa molar (Ar/Mr) dapat kita simpulkan bahwa ketiganya memiliki keterkaitan yang digambarkan sebagai berikut:',
      indent: 0,
    ),

    ImageBlock(
      assetPath:   'assets/images/material/materi_3_1.png',
      width: 200,
    ),

    // Pertanyaan reflektif
    ParagraphBlock(
      '💡 Pertanyaan berikutnya: Sampai sekarang, kita belajar tentang zat padat (seperti besi, garam) dan cair (seperti air). Perhitungannya pakai massa (gram). Tapi bagaimana dengan gas?',
      isBold: true,
    ),
  ];
}