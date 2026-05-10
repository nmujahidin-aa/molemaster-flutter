import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class MateriBab6 {
  static const List<MateriBlock> blocks = [
    // Heading utama
    HeadingBlock('6. Pengenalan Molaritas', level: 1),

    // Paragraf pembuka
    ParagraphBlock(
      'Apakah konsep mol hanya berhenti di sini? Tentu tidak, konsep mol juga digunakan dalam berbagai perhitungan kimia, salah satunya dalam menentukan konsentrasi larutan.',
      indent: 0,
    ),

    ParagraphBlock(
      'Banyaknya zat yang terdapat dalam suatu larutan dapat diketahui dengan menggunakan konsentrasi larutan yang dinyatakan dalam molaritas (M). Molaritas menyatakan banyaknya mol zat dalam 1 L larutan. Rumusnya adalah:',
      indent: 0,
    ),

    ParagraphBlock('',),
    // Rumus Molaritas
    MathBlock(
      r'M = \frac{n}{V} \quad \text{atau} \quad n = M \times V',
      highlight: true,
    ),

    ParagraphBlock('',),

    ParagraphBlock(
      'M = konsentrasi (mol/L)',
    ),
    ParagraphBlock(
      'n = jumlah mol (mol)',
    ),
    ParagraphBlock(
      'V = volume larutan (L)',
    ),

    ParagraphBlock('',),

    ParagraphBlockPartial(
      [
        CustomTextSpan('📝 CATATAN: \n', isBold: true),
        CustomTextSpan(
          'Pada materi ini, molaritas hanya diperkenalkan sebagai aplikasi konsep mol, namun tidak dibahas lebih lanjut dalam media. Perhitungan dan pembahasan lebih lanjut akan dipelajari pada materi larutan.',
        ),
      ],
      highlight: true,
    ),
  ];
}