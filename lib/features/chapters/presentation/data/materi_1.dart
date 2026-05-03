import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/bullet_list_block.dart';

import '../../domain/entities/materi_block.dart';

class MateriBab1 {
  static const List<MateriBlock> blocks = [
    ParagraphBlock(
      'Pada bab struktur atom, kalian telah mempelajari nomor massa dan nomor atom. Satuan massa atom memberikan skala relatif untuk nilai massa suatu unsur. Tetapi, karena atom memiliki massa yang sangat kecil, tidak mungkin bagi kalian untuk menghitung atau menimbang atom-atom tersebut dalam satuan massa atom yang terkalibrasi. Dalam situasi nyata di laboratorium, kita berurusan dengan sampel makroskopik yang mengandung jumlah atom sangat besar. Contohnya, garam dapur (NaCl) yang ditimbang di neraca tampak hanya sebagai serbuk putih — padahal di dalamnya terkandung atom natrium dan klorin yang tak terhitung jumlahnya. Visualisasi ketiga level representasi ini dapat dilihat pada gambar di bawah.',
      indent: 0,
    ),

    ImageBlock(
      assetPath: 'assets/images/material/materi_1_1.png',
      width: 220,
      caption: '',
    ),

    ParagraphBlockPartial(
      [
        CustomTextSpan("Pernahkah kalian berpikir: ", isBold: true),
        CustomTextSpan("Bagaimana para ilmuwan menghitung atom yang jumlahnya sangat banyak? Seperti kalian menyebut 2 orang sejoli sebagai 1 pasangan, 12 buku sebagai 1 lusin, dan 144 item sebagai 1 gross. Para kimiawan juga mengukur atom dan molekul dalam "),
        CustomTextSpan("satuan mol.", isBold: true),
      ],
      highlight: true,
    ),

    ParagraphBlockPartial(
      [
        CustomTextSpan("Dalam Sistem Satuan Internasional (SI), "),
        CustomTextSpan("mol ", isBold: true),
        CustomTextSpan("adalah jumlah zat yang mengandung tepat \$6{,}022 \\times 10^{23}\$ partikel (baik unsur, molekul, atau ion). Sehingga, dari analogi di atas, dapat disimpulkan bahwa 1 mol = \$6{,}022 \\times 10^{23}\$ partikel. Sebagai contoh, 1 mol besi (Fe) mengandung \$6{,}022 \\times 10^{23}\$ atom besi. Visualisasinya dapat dilihat pada gambar di bawah ini."),
      ],
    ),

    ImageBlock(
      assetPath: 'assets/images/material/materi_1_2.png',
      width: 220,
      caption: '',
    ),

    // Bagaimana cara menyatakan jumlah partikel
    ParagraphBlock(
      'Bagaimana cara menyatakan jumlah partikel yang terkandung dalam unsur atau ion?',
      indent: 0,
    ),

    BulletListBlock(
      [
        '1 mol unsur natrium (Na) memiliki \$6{,}022 \\times 10^{23}\$ partikel unsur Na',
        '1 mol ion K⁺ memiliki \$6{,}022 \\times 10^{23}\$ partikel ion K⁺',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Bagaimana jika ingin menyatakan jumlah partikel dalam 0,5 mol, 2 mol, dan seterusnya?',
      indent: 0,
    ),

    BulletListBlock(
      [
        '0,5 mol unsur Y memiliki \$0{,}5 \\times 6{,}022 \\times 10^{23}\$ partikel, atau \$3{,}011 \\times 10^{23}\$ partikel unsur Y',
        '2 mol ion Z⁺ memiliki \$2 \\times 6{,}022 \\times 10^{23}\$ partikel, atau \$12{,}044 \\times 10^{23}\$ partikel ion Z⁺',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Dari perhitungan di atas, dapat kita tarik kesimpulan sebagai berikut:',
      indent: 15,
    ),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Jumlah partikel }(X) &= n \times 6{,}022 \times 10^{23} \\'
      r'n &= \frac{x}{6{,}022 \times 10^{23}}'
      r'\end{aligned}',
      highlight: true,
    ),

    // Contoh soal
    ParagraphBlock('Contoh:', indent: 15, isBold: true),

    ParagraphBlock(
      'Terdapat sejumlah sampel gas klorin (dengan rumus kimia Cl₂) dalam sebuah wadah tertutup. Gas ini tidak berwarna namun berbau menyengat. Diketahui sampel tersebut mengandung \$1{,}505 \\times 10^{23}\$ molekul Cl₂. Berapa mol Cl₂ yang terkandung dalam sampel tersebut?',
      indent: 15,
    ),

    ParagraphBlock('Jawab:', indent: 15, isBold: true),

    MathBlock(
      r'\begin{aligned}'
      r'n &= \frac{X}{6{,}022 \times 10^{23}} \\'
      r'  &= \frac{1{,}505 \times 10^{23}}{6{,}022 \times 10^{23}} \\'
      r'  &= 0{,}25 \text{ mol}'
      r'\end{aligned}',
    ),

    // Soal 2
    ParagraphBlock(
      'Terdapat sebuah batangan logam emas murni (dengan simbol unsur Au) berwarna kuning mengkilap. Diketahui sampel logam emas tersebut mengandung 5 mol Au',
      indent: 15,
    ),

    ParagraphBlockPartial(
      [
        CustomTextSpan('a.', isBold: true),
        CustomTextSpan('Apakah jenis partikel unsur emas?'),
      ],
      indent: 15,
    ),

    ParagraphBlockPartial(
      [
        CustomTextSpan('Jawab: ', isBold: true),
        CustomTextSpan('Emas adalah unsur logam, sehingga jenis partikelnya adalah atom emas'),
      ],
      indent: 24,
    ),
    
    ParagraphBlockPartial(
      [
        CustomTextSpan('b.', isBold: true),
        CustomTextSpan('Berapakah jumlah partikel dalam sampel tersebut?'),
      ],
      indent: 15,
    ),

    ParagraphBlock('Jawab:', indent: 24, isBold: true),

    MathBlock(
      r'\begin{aligned}'
      r'X &= n \times 6{,}022 \times 10^{23} \\'
      r'  &= 5 \times 6{,}022 \times 10^{23} \\'
      r'  &= 3{,}01 \times 10^{24} \text{ partikel atom emas}'
      r'\end{aligned}',
    ),

    // Soal 3
    ParagraphBlock(
      'Dalam 3 mol C₂H₅OH (etanol), berapa banyak atom C, H, dan O yang terkandung di dalamnya secara berurutan?',
      indent: 15,
    ),

    ParagraphBlock('Jawab:', indent: 24, isBold: true),

    ParagraphBlock(
      'Setiap 1 molekul etanol mengandung 2 atom C, 6 atom H, dan 1 atom O',
      indent: 24,
    ),

    ParagraphBlock(
      'Maka dalam 3 mol C₂H₅OH:',
      indent: 24,
    ),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Jumlah mol atom C} &= 3 \times 2 = 6 \text{ mol atom C} \\'
      r'\text{Jumlah mol atom H} &= 3 \times 6 = 18 \text{ mol atom H} \\'
      r'\text{Jumlah mol atom O} &= 3 \times 1 = 3 \text{ mol atom O}'
      r'\end{aligned}',
    ),

    ParagraphBlock('Sehingga,', indent: 24),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Banyak atom C} &= 6 \times 6{,}022 \times 10^{23} = 3{,}613 \times 10^{24} \text{ partikel atom C} \\'
      r'\text{Banyak atom H} &= 18 \times 6{,}022 \times 10^{23} = 1{,}084 \times 10^{25} \text{ partikel atom H} \\'
      r'\text{Banyak atom O} &= 3 \times 6{,}022 \times 10^{23} = 1{,}807 \times 10^{24} \text{ partikel atom O}'
      r'\end{aligned}',
    ),

    // Tabel perbandingan
    ParagraphBlock(
      'Untuk memastikan pemahaman kalian, perhatikan tabel perbandingan 1 mol dari berbagai unsur berikut:',
    ),

    TableBlock(
      headers: ['Unsur', 'Jumlah Atom', 'Massa Sampel (g)'],
      rows: [
        ['Aluminum', '6.022 × 10²³', '26.98'],
        ['Tembaga', '6.022 × 10²³', '63.55'],
        ['Besi', '6.022 × 10²³', '55.85'],
        ['Belerang', '6.022 × 10²³', '32.07'],
        ['Iodium', '6.022 × 10²³', '126.9'],
        ['Raksa', '6.022 × 10²³', '200.6'],
      ],
    ),

    // Penjelasan
    ParagraphBlock(
      'Sampel suatu unsur yang jumlahnya 1 mol (mengandung \$6{,}022 \\times 10^{23}\$ atom) memiliki massa yang berbeda-beda, sesuai dengan massa atom relatif (Ar) unsur tersebut. Dengan kata lain, 1 mol unsur selalu mengandung jumlah partikel yang sama, tetapi massanya bergantung pada jenis unsurnya. Hal ini dapat kita amati secara nyata — misalnya, 1 mol aluminium berupa padatan logam abu-abu, sedangkan 1 mol belerang berupa serbuk kuning, keduanya mengandung jumlah atom yang sama namun massanya berbeda.',
    ),

    // Pertanyaan reflektif
    ParagraphBlock(
      'Pertanyaan berikutnya: Jika 1 mol berbagai unsur mengandung jumlah partikel yang sama, mengapa massanya berbeda? Mari kita pelajari tentang Ar dan Mr!',
      isBold: true,
    ),
  ];
}