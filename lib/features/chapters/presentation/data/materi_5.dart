import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

class MateriBab5 {
  static const List<MateriBlock> blocks = [
    HeadingBlock('5. Perbandingan Volume (Reaksi Gas)', level: 1),

    ParagraphBlock(
      'Menurut hukum Avogadro, perbandingan gas-gas yang jumlah molnya sama memiliki volume sama. Pada suhu dan tekanan yang sama, volume gas hanya bergantung pada jumlah molnya. Artinya, perbandingan mol akan menyatakan perbandingan volume. Misalkan, gas pertama dengan jumlah mol n₁ dan volume V₁ serta gas kedua dengan jumlah mol n₂ dan volume V₂. Pada suhu dan tekanan yang sama dapat dinyatakan sebagai berikut:',
      indent: 0,
    ),

    ParagraphBlock('',),
    MathBlock(
      r'\frac{V_1}{V_2} = \frac{n_1}{n_2} \quad \text{atau} \quad \frac{n_1}{V_1} = \frac{n_2}{V_2}',
      highlight: true,
    ),

    ParagraphBlock(
      'V₁ dan n₁ adalah volume dan mol milik gas 1',
      indent: 12,
    ),
    ParagraphBlock(
      'V₂ dan n₂ adalah volume dan mol milik gas 2',
      indent: 12,
    ),

    ParagraphBlock('',),

    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    ParagraphBlock(
      'Tentukan volume dari 2 mol gas nitrogen jika diukur pada suhu dan tekanan yang sama di mana 0,5 mol gas oksigen mempunyai volume 15 liter',
      indent: 12,
    ),

    ParagraphBlock('Jawab:', indent: 12, isBold: true),

    MathBlock(r'\frac{V_1}{V_2} = \frac{n_1}{n_2}'),

    MathBlock(r'\frac{V_{O_2}}{V_{N_2}} = \frac{n_{O_2}}{n_{N_2}}'),

    ParagraphBlock('',),
    MathBlock(
      r'V_{N_2} = \frac{n_{N_2}}{n_{O_2}} \times V_{O_2} = \frac{2 \text{ mol}}{0,5 \text{ mol}} \times 15 \text{ L} = 60 \text{ L}',
      highlight: true,
    ),

    ParagraphBlock('',),

    // Contoh 2
    ParagraphBlock(
      'Berapa volume 4 g gas metana (CH₄) yang diukur pada keadaan sama dengan 3 g NO yang volumenya 5 L? (Ar: H = 1, C = 12, N = 14, O = 16)',
      indent: 12,
    ),

    ParagraphBlock('Jawab:', indent: 12, isBold: true),

    ParagraphBlock(
      'Mr CH₄ = (1 × 12) + (4 × 1) = 16',
      indent: 24,
    ),

    MathBlock(
      r'\text{Mol CH₄} = \frac{\text{massa CH₄}}{\text{Mr CH₄}} = \frac{4 \text{ gram}}{16} = 0,25 \text{ mol}',
    ),

    ParagraphBlock(
      'Mr NO = 14 + 16 = 30',
      indent: 24,
    ),

    MathBlock(
      r'\text{Mol NO} = \frac{\text{massa NO}}{\text{Mr NO}} = \frac{3 \text{ gram}}{30} = 0,1 \text{ mol}',
    ),

    MathBlock(r'\frac{V_1}{V_2} = \frac{n_1}{n_2}'),

    MathBlock(r'\frac{V_{CH_4}}{V_{NO}} = \frac{n_{CH_4}}{n_{NO}}'),

    ParagraphBlock('',),
    MathBlock(
      r'V_{CH_4} = \frac{n_{CH_4}}{n_{NO}} \times V_{NO} = \frac{0,25 \text{ mol}}{0,1 \text{ mol}} \times 5 \text{ L} = 12,5 \text{ L}',
      highlight: true,
    ),

    ParagraphBlock('',),

    ParagraphBlock(
      '💡 Pertanyaan berikutnya: Selama ini kita belajar tentang zat padat (gram) dan gas (L). Tapi bagaimana dengan larutan (misalnya: garam larut dalam air)? Apa artinya "0,9%" atau "2 M"?',
      isBold: true,
      highlight: true,
    ),
  ];
}