import '../../domain/entities/materi_block.dart';

class MateriBab6 {
  static List<MateriBlock> blocks = [
    HeadingBlock('6. Molaritas dan Hubungannya dengan Mol', level: 1),
    ParagraphBlock(
      '💉 TAHUKAH KAMU?\n'
      'Cairan infus di rumah sakit adalah larutan NaCl 0,9 M. Konsentrasi ini '
      'sama dengan konsentrasi garam dalam darah kita. Jika lebih pekat atau '
      'lebih encer, kondisi ini bisa berbahaya!',
      highlight: true,
    ),

    // ===== Pengantar =====
    ParagraphBlock(
      'Molaritas (M) adalah salah satu cara menyatakan konsentrasi atau kepekatan '
      'larutan. Banyaknya zat yang terdapat dalam suatu larutan dapat diketahui '
      'dengan menggunakan konsentrasi larutan yang dinyatakan dalam molaritas (M).',
    ),

    // ===== Ilustrasi =====
    ImageBlock(
      assetPath: 'assets/images/molaritas-ilustrasi.png',
      width: 280,
      border: true,
      caption: 'Ilustrasi distribusi partikel zat terlarut dalam larutan',
    ),

    // ===== Definisi =====
    ParagraphBlock(
      'Molaritas menyatakan banyaknya mol zat dalam 1 liter larutan. '
      'Rumus molaritas adalah:',
    ),

    MathBlock(
      r'M = \frac{n}{V}'
      r'\quad \text{atau} \quad'
      r'n = M \times V',
      highlight: true,
    ),

    // ===== Keterangan =====
    ParagraphBlock('dengan:'),
    ParagraphBlock('M = konsentrasi larutan (mol/L)'),
    ParagraphBlock('n = jumlah mol zat terlarut (mol)'),
    ParagraphBlock('V = volume larutan (L)'),

    // ===== Contoh 1 =====
    ParagraphBlock('Contoh:', isBold: true),

    ParagraphBlock(
      'Berapakah molaritas larutan yang dibuat dengan melarutkan 5,85 gram '
      'NaCl (Ar Na = 23, Cl = 35,5) dalam 500 mL air?',
    ),

    ParagraphBlock('Jawab:'),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Mr NaCl} &= 23 + 35{,}5 = 58{,}5 \\'
      r'\text{mol NaCl} &= \frac{5{,}85}{58{,}5} = 0{,}1 \\'
      r'M &= \frac{0{,}1}{0{,}5} = 0{,}2\ \text{M}'
      r'\end{aligned}',
      highlight: true,
    ),

    // ===== Contoh 2 =====
    ParagraphBlock(
      'Hitunglah massa NaOH (Ar Na = 23, O = 16, dan H = 1) yang harus '
      'dilarutkan untuk membuat 100 mL larutan NaOH 0,1 M!',
    ),

    ParagraphBlock('Jawab:'),

    MathBlock(
      r'\begin{aligned}'
      r'\text{Mr NaOH} &= 23 + 16 + 1 = 40 \\'
      r'\text{massa NaOH} &= M \times V \times \text{Mr} \\'
      r'&= 0{,}1 \times 0{,}1 \times 40 = 0{,}4\ \text{gram}'
      r'\end{aligned}',
      highlight: true,
    ),

    // ===== Refleksi =====
    ParagraphBlock(
      '❓ Pertanyaan berikutnya: Sekarang kamu sudah menguasai semua konsep '
      'penting. Bagaimana cara menghubungkan SEMUA konsep ini dalam satu '
      'perhitungan kimia?',
      highlight: true,
    ),

    // ===== Tahukah Kamu (Penutup) =====
    ParagraphBlock(
      '🥤 TAHUKAH KAMU?\n'
      'Minuman isotonik seperti Pocari Sweat dirancang dengan molaritas '
      'elektrolit yang hampir sama dengan cairan tubuh manusia. Tanpa konsep '
      'mol dan molaritas, kita tidak akan memiliki minuman isotonik yang aman '
      'dan efektif. Pada akhirnya, efektivitas minuman isotonik bergantung '
      'pada berapa banyak mol ion yang terlarut dan jumlah partikel kecil '
      'yang bekerja di dalam tubuh!',
      highlight: true,
    ),
  ];
}