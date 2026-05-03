import '../../domain/entities/materi_block.dart';

class MateriBab7 {
  static List<MateriBlock> blocks = [
    HeadingBlock('7. Jembatan Mol (Akhir, Sebagai Peta Besar)', level: 1),
    ParagraphBlock(
      'Bayangkan konsep-konsep yang sudah dipelajari (Massa Zat, Jumlah Partikel,'
      'Volume Gas (STP), dan Molaritas) sebagai empat pintu terpisah dalam sebuah '
      'ruangan. Meskipun semuanya penting, kita tidak bisa berpindah dari satu pintu ke'
      'pintu lain (misalnya, dari Massa langsung ke Volume Gas) tanpa melalui pintu utama.',
    ),

    ParagraphBlock(
      'Siapa pintu utama di sini? Benar sekali, Mol!',
      highlight: true,
      isBold: true,
    ),

    ParagraphBlock(
      'Mol adalah kunci emas dan pusat konversi yang menjadi jembatan penghubung bagi semua kuantitas zat.'
      'Dengan mengetahui jumlah mol suatu zat, kita bisa dengan mudah menghitung Massa (menggunakan Massa Molar), '
      'Jumlah Partikel (menggunakan Bilangan Avogadro), Volume Gas (menggunakan 22,4 L/mol),'
      'bahkan Molaritas larutan (menggunakan Volume Larutan).',
    ),

    ParagraphBlock(
      'Jadi, dalam setiap perhitungan, fokuslah untuk menemukan mol terlebih dahulu, karena semua alur konversi berpusat pada Mol.',
      highlight: true,
    ),

    ImageBlock(
      assetPath: 'assets/images/expanded-mole-bridge.png',
      width: 220,
      caption: 'Ilustrasi Expanded Mole Bridge',
    ),
  ];
}