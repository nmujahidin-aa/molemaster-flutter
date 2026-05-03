import '../../domain/entities/materi_block.dart';

class MateriBab5 {
  static List<MateriBlock> blocks = [
    HeadingBlock('5. Perbandingan Volume (Reaksi Gas)', level: 1),

    const ParagraphBlock(
      'Menurut hukum Avogadro, perbandingan gas-gas yang jumlah molnya sama '
      'memiliki volume yang sama. Pada suhu dan tekanan yang sama, volume gas '
      'hanya bergantung pada jumlah molnya.',
    ),

    const ParagraphBlock(
      'Artinya, perbandingan mol akan menyatakan perbandingan volume. Misalkan '
      'gas pertama dengan jumlah mol n₁ dan volume V₁ serta gas kedua dengan '
      'jumlah mol n₂ dan volume V₂. Pada suhu dan tekanan yang sama dapat '
      'dinyatakan sebagai berikut:',
    ),

    // ===== Rumus utama =====
    const MathBlock(
      r'\frac{V_1}{V_2} = \frac{n_1}{n_2}'
      r'\quad \text{atau} \quad'
      r'\frac{n_1}{V_1} = \frac{n_2}{V_2}',
      highlight: true,
    ),

    const ParagraphBlock(
      'V₁ dan n₁ adalah volume dan mol milik gas 1',
    ),
    const ParagraphBlock(
      'V₂ dan n₂ adalah volume dan mol milik gas 2',
    ),

    // ===== Contoh 1 =====
    const ParagraphBlock('Contoh:', isBold: true),

    const ParagraphBlock(
      'Tentukan volume dari 2 mol gas nitrogen jika diukur pada suhu dan tekanan '
      'yang sama di mana 0,5 mol gas oksigen mempunyai volume 15 liter.',
    ),

    const ParagraphBlock('Jawab:'),

    const MathBlock(
      r'\begin{aligned}'
      r'\frac{V_{O_2}}{V_{N_2}} &= \frac{n_{O_2}}{n_{N_2}} \\'
      r'V_{N_2} &= \frac{n_{N_2}}{n_{O_2}} \times V_{O_2} \\'
      r'&= \frac{2}{0{,}5} \times 15 = 60\ \text{L}'
      r'\end{aligned}',
      highlight: true,
    ),

    // ===== Contoh 2 =====
    const ParagraphBlock(
      'Berapa volume 4 g gas metana (CH₄) yang diukur pada keadaan yang sama '
      'dengan 3 g NO volumenya 5 L? (Ar: H = 1, C = 12, N = 14, O = 16)',
    ),

    const ParagraphBlock('Jawab:'),

    const MathBlock(
      r'\begin{aligned}'
      r'\text{Mr CH}_4 &= 16 \Rightarrow n_{CH_4} = \frac{4}{16} = 0{,}25 \\'
      r'\text{Mr NO} &= 30 \Rightarrow n_{NO} = \frac{3}{30} = 0{,}1'
      r'\end{aligned}',
    ),

    const MathBlock(
      r'\begin{aligned}'
      r'\frac{V_{CH_4}}{V_{NO}} &= \frac{n_{CH_4}}{n_{NO}} \\'
      r'V_{CH_4} &= \frac{0{,}25}{0{,}1} \times 5 = 12{,}5\ \text{L}'
      r'\end{aligned}',
      highlight: true,
    ),

    // ===== Contoh 3 Reaksi Gas =====
    const ParagraphBlock(
      '6,00 L propana (C₃H₈) dibakar sempurna pada suhu dan tekanan yang sama '
      'dengan reaksi pembakaran:',
    ),

    const MathBlock(
      r'\text{C}_3\text{H}_8(g) + 5\text{O}_2(g) \rightarrow '
      r'3\text{CO}_2(g) + 4\text{H}_2\text{O}(g)',
    ),

    const ParagraphBlock(
      'Tentukan volume O₂ yang dibutuhkan dan volume CO₂ serta H₂O yang terbentuk!',
    ),

    const ParagraphBlock('Jawab:'),

    const ParagraphBlock(
      'Karena kondisi suhu dan tekanan (T,P) sama, volume gas sebanding dengan '
      'koefisien reaksi.',
      highlight: true,
    ),

    const ParagraphBlock('Diketahui V C₃H₈ = 6,00 L'),

    const MathBlock(
      r'\begin{aligned}'
      r'V_{O_2} &= 5 \times 6{,}00 = 30{,}0\ \text{L} \\'
      r'V_{CO_2} &= 3 \times 6{,}00 = 18{,}0\ \text{L} \\'
      r'V_{H_2O} &= 4 \times 6{,}00 = 24{,}0\ \text{L}'
      r'\end{aligned}',
      highlight: true,
    ),

    // ===== Refleksi =====
    const ParagraphBlock(
      '❓ Pertanyaan berikutnya: Selama ini kita belajar tentang zat padat (gram) '
      'dan gas (liter). Tapi bagaimana dengan larutan (misalnya: garam larut dalam '
      'air)? Apa arti “0,9%” atau “2 M”?',
      highlight: true,
    ),

    // ===== Tahukah Kamu =====
    const ParagraphBlock(
      '🚀 TAHUKAH KAMU?\n'
      'Roket SpaceX Falcon 9 menggunakan perhitungan perbandingan volume gas yang '
      'sangat presisi! Kesalahan 0,1% saja dapat menyebabkan roket gagal mencapai '
      'orbit atau menimbulkan kerugian ratusan juta dolar. Engineer roket adalah '
      'master perhitungan mol dan perbandingan volume. Tanpa kimia, tidak ada '
      'eksplorasi luar angkasa!',
      highlight: true,
    ),
  ];
}