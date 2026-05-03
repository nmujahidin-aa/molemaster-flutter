import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/bullet_list_block.dart';
import '../../domain/entities/materi_block.dart';

class MateriBab2 {
  static const List<MateriBlock> blocks = [
    // Heading utama
    HeadingBlock('2. Ar dan Mr (Massa Atom dan Massa Molekul Relatif)', level: 1),

    // Paragraf pembuka
    ParagraphBlock(
      'Kalian telah mempelajari pengertian mol pada sub bab sebelumnya. Berikutnya, kalian akan diperkenalkan besaran penting dalam kimia, yaitu Massa Molar (Mm). Massa molar (Mm) menyatakan massa yang dimiliki oleh 1 mol zat. Setiap unsur tersusun dari atom-atom yang memiliki massa sangat kecil sehingga sulit diukur secara langsung. Oleh karena itu, para ilmuwan membuat skala pembanding yang disebut satuan massa atom (sma) untuk memudahkan perbandingan massa antar atom. Sebagai titik acuan, dipilih satu isotop — yaitu atom dari unsur yang sama namun memiliki jumlah neutron berbeda. Tahukah kalian? Karbon sendiri sebenarnya memiliki beberapa isotop, yaitu karbon-12 (C-12), karbon-13 (C-13), dan karbon-14 (C-14).',
      indent: 0,
    ),

    ImageBlock(
      assetPath: 'assets/images/material/materi_2_1.png',
      width: 220,
      caption: '',
    ),

    // Penjelasan isotop karbon
    ParagraphBlock(
      'Namun dari ketiganya, yang dipilih sebagai acuan adalah C-12, karena paling stabil, paling banyak ditemukan di alam (sekitar 98,9%). Maka dari itu, IUPAC menetapkan bahwa:',
      indent: 0,
    ),

    MathBlock(
      r'1 \, \text{sma} = \frac{1}{12} \, \text{massa satu atom C-12 isotop}',
      highlight: true,
    ),
    ParagraphBlock(
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{Massa 1 atom karbon = 12 sma}',
      highlight: true,
    ),

    ParagraphBlock(
      'Satu hal menarik lainnya — di alam, suatu unsur hampir selalu ditemukan sebagai campuran dari beberapa isotopnya, bukan isotop tunggal. Misalnya, klor (Cl) di alam terdiri atas campuran ³⁵Cl dan ³⁷Cl. Hal ini berarti massa atom suatu unsur di alam bukanlah nilai tunggal, melainkan nilai rata-rata dari seluruh isotop yang ada.',
      indent: 0,
    ),

    ParagraphBlock(
      'Berdasarkan skala inilah, massa setiap atom dan molekul dapat ditentukan secara relatif, yang kita kenal sebagai Massa Atom Relatif (Ar) dan Massa Molekul Relatif (Mr). Perlu diperhatikan bahwa Ar dan Mr merupakan bilangan relatif tanpa satuan, karena keduanya menyatakan perbandingan massa. Namun, secara numerik nilai Ar dan Mr inilah yang menjadi dasar massa molar suatu zat. Massa molar menyatakan massa 1 mol zat dengan satuan gram/mol, sehingga:',
      indent: 0,
    ),

    BulletListBlock(
      [
        'Massa molar unsur = nilai Ar, dalam g/mol',
        'Massa molar senyawa = nilai Mr, dalam g/mol',
        'Contoh: Ar Cu = 64 (tanpa satuan), maka massa molar Cu = 64 g/mol',
      ],
      indent: 15,
    ),

    // Sub bab a. Massa Atom Relatif (Ar)
    HeadingBlock('a. Massa Atom Relatif (Ar)', level: 2),

    ParagraphBlock(
      'Massa Atom Relatif (Ar) adalah perbandingan massa rata-rata satu atom suatu unsur terhadap 1/12 massa satu atom C-12. Secara matematis, dapat dituliskan sebagai:',
      indent: 0,
    ),

    MathBlock(
      r'\text{Ar X} = \frac{\text{massa rata-rata 1 atom unsur X}}{\frac{1}{12} \text{massa 1 atom isotop C-12}}',
      highlight: true,
    ),

    ParagraphBlock( 
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{atau}',
    ),

    ParagraphBlock( 
      '',
      indent: 0,
    ),

    MathBlock(
      r'\text{Ar X} = \frac{\text{massa rata-rata 1 atom unsur X}}{\frac{1}{12} \times 12 \text{ sma}}',
      highlight: true,
    ),

    // Contoh soal Ar
    ParagraphBlock('Contoh soal:', indent: 15, isBold: true),

    ParagraphBlock(
      'Diketahui massa rata-rata 1 atom unsur magnesium (Mg) adalah 4,037 × 10⁻²³ gram, dan massa 1 atom isotop C-12 adalah 1,993 × 10⁻²³ gram. Hitunglah Ar dari unsur Magnesium (Mg)!',
      indent: 15,
    ),

    ParagraphBlock('Jawab:', indent: 15, isBold: true),

    MathBlock(
      r'\text{Ar Mg} = \frac{\text{massa rata-rata 1 atom Mg}}{\frac{1}{12} \text{massa 1 atom C-12}}',
    ),

    MathBlock(
      r'\text{Ar Mg} = \frac{4,037 \times 10^{-23}}{\frac{1}{12} \times 1,993 \times 10^{-23}}',
    ),

    MathBlock(
      r'\text{Ar Mg} = \frac{4,037 \times 10^{-23}}{1,661 \times 10^{-24}} = \frac{4,037}{0,1661} = 24,3',
    ),

    ParagraphBlock(
      'Karena 1/12 massa satu atom C-12 ditetapkan sebagai satuan massa atom (sma), maka rumus di atas dapat disederhanakan menjadi:',
      indent: 0,
    ),

    MathBlock(
      r'\text{Ar X} = \text{massa rata-rata 1 atom unsur X}',
      highlight: true,
    ),

    ParagraphBlock(
      'Dengan kata lain, nilai Ar suatu unsur menunjukkan berapa kali lebih berat rata-rata atom unsur tersebut dibandingkan 1 sma. Itulah mengapa nilai Ar tidak memiliki satuan — karena merupakan perbandingan.',
      indent: 0,
    ),

    // Tabel Ar
    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    TableBlock(
      headers: ['Nama Zat', 'Rumus', 'Massa Zat (Dalam 1 Mol)', 'Massa Atom Relatif (Ar)'],
      rows: [
        ['Besi', 'Fe', '56 gram', '56'],
        ['Karbon', 'C', '12 gram', '12'],
        ['Oksigen', 'O', '16 gram', '16'],
      ],
    ),

    ParagraphBlock(
      'Massa suatu zat dapat dihitung dengan mengalikan jumlah mol zat (n) tersebut dengan massa molarnya (gram/mol). Massa molar suatu zat nilainya sama dengan Ar (untuk unsur/atom) atau Mr (untuk senyawa/molekul) dengan mol zat tersebut (n).',
      indent: 0,
    ),

    MathBlock(
      r'\text{Massa zat (g)} = n \times \text{massa molar (g/mol)}',
      highlight: true,
    ),

    ParagraphBlock('atau dapat ditulis:', indent: 0),

    MathBlock(
      r'm = n \times \text{Ar (untuk unsur)}',
    ),

    // Contoh massa molar
    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    BulletListBlock(
      [
        'Massa molar besi (Fe) = massa dari 1 mol besi (Fe) = Ar Fe = 56\nArtinya, dalam 1 mol, nilai Ar Fe adalah 56, sehingga besi memiliki massa 56 gram',
        'Massa molar karbon (C) = massa dari 1 mol karbon (C) = Ar C = 12\nArtinya, dalam 1 mol, nilai Ar C adalah 12, sehingga karbon memiliki massa 12 gram',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Karena unsur di alam merupakan campuran isotop, maka Ar suatu unsur dihitung sebagai rata-rata tertimbang dari massa seluruh isotopnya berdasarkan kelimpahannya di alam. Contoh: Di alam, klor terdiri atas ³⁵Cl (kelimpahan 75%) dan ³⁷Cl (kelimpahan 25%), sehingga:',
      indent: 0,
    ),

    MathBlock(
      r'\text{Ar Cl} = (75\% \times 35) + (25\% \times 37) = 35,5',
      highlight: true,
    ),

    // Sub bab b. Massa Molekul Relatif (Mr)
    HeadingBlock('b. Massa Molekul Relatif (Mr)', level: 2),

    ParagraphBlock(
      'Massa molekul relatif (Mr) adalah perbandingan massa rata-rata satu molekul suatu senyawa terhadap 1/12 massa satu atom C-12 isotop. Karena molekul terdiri dari beberapa atom, maka Mr merupakan jumlah Ar atom-atom penyusunnya. Sehingga, rumus untuk mencari Mr adalah:',
      indent: 0,
    ),

    MathBlock(
      r'\text{Mr} = \Sigma \text{Ar}_i',
      highlight: true,
    ),

    BulletListBlock(
      [
        'Mr = massa molekul relatif',
        'Ar = massa atom relatif',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Setiap zat punya massa tertentu untuk setiap 1 mol-nya. Besarnya sama dengan nilai Mr dalam gram.',
      indent: 0,
    ),

    // Tabel Mr
    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    TableBlock(
      headers: ['Nama Zat', 'Rumus', 'Massa Zat (Dalam 1 Mol)', 'Massa Molekul Relatif (Mr)'],
      rows: [
        ['Garam Dapur', 'NaCl', '58,5 gram', '58,5'],
        ['Air', 'H₂O', '18 gram', '18'],
      ],
    ),

    // Poin-poin penting
    BulletListBlock(
      [
        'Unsur diatomik (O₂, H₂, N₂, dan lainnya) massa molarnya dihitung menggunakan Mr (Massa Molekul Relatif), bukan Ar, karena keduanya terdiri dari 2 atom yang berikatan.',
        'Jika ada koefisien (contoh 2H₂O), Mr dihitung berdasarkan 1 molekul saja, sehingga koefisien tidak ikut dihitung dalam Mr. Koefisien menunjukkan jumlah molekul yang digunakan untuk menghitung massa total, bukan Mr-nya.',
        'Jika ada indeks (contoh MgCl₂), indeks menyatakan jumlah dari atom Cl, yaitu 2. Sehingga perhitungannya adalah: Ar Mg + (2 × Ar Cl)',
        'Jika ada kristal hidrat (contoh CuSO₄·5H₂O), maka Mr dari H₂O akan dikalikan 5. Jadi, angka 5 pada CuSO₄·5H₂O bukan koefisien reaksi, tapi bagian dari rumus senyawa itu sendiri',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Massa zat bisa dihitung dari jumlah mol dikali massa molarnya.',
      indent: 0,
    ),

    MathBlock(
      r'\text{Massa zat} = \text{Massa molar (Mr)} \times n',
      highlight: true,
    ),

    // Contoh perhitungan Mr
    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Mr H}_2 &= 2 \times \text{Ar H} \\'
      r'  &= 2 \times 1 = 2'
      r'\end{aligned}',
    ),

    ParagraphBlock('Massa molar H₂ = massa dari 1 mol H₂', indent: 15),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Mr CO}_2 &= \text{Ar C} + (2 \times \text{Ar O}) \\'
      r'  &= 12 + (2 \times 16) \\'
      r'  &= 44'
      r'\end{aligned}',
    ),

    ParagraphBlock('Massa molar CO₂ = massa dari 1 mol CO₂', indent: 15),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Mr H}_2\text{SO}_4 &= (2 \times \text{Ar H}) + \text{Ar S} + (4 \times \text{Ar O}) \\'
      r'  &= (2 \times 1) + 32 + (4 \times 16) \\'
      r'  &= 2 + 32 + 64 \\'
      r'  &= 98'
      r'\end{aligned}',
    ),

    ParagraphBlock('Massa molar H₂SO₄ = massa dari 1 mol H₂SO₄', indent: 15),

    // Pertanyaan penutup
    ParagraphBlock(
      'Pertanyaan berikutnya: Bagaimana jika kita punya 2,5 mol Fe? Atau 0,3 mol H₂O? Bagaimana cara menghitung massanya?',
      indent: 0,
      isBold: true,
    ),
  ];
}