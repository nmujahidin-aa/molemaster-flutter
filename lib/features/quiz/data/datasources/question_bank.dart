import '../models/question_model.dart';

class QuestionBank {
  static List<QuestionModel> questions({required String type, required int materiId}) {
    if (type == 'pretest') return _pretest;
    if (type == 'posttest' && materiId == 0) return _posttest;

    if (type == 'chapter_test') {
      return _chapterTests[materiId] ?? const [];
    }

    if (type == 'adventure' && materiId == 0) return _adventure;
    if (type == 'training' && materiId == 0) return _training;

    return const [];
  }

  // =========================
  // PRETEST (10)
  // =========================
  static const List<QuestionModel> _pretest = [
    QuestionModel(
      id: 'pre_001',
      type: 'pretest',
      materiId: 0,
      question: '1 mol zat mengandung jumlah partikel sebanyak ...',
      options: {
        'A': '6,022×10²²',
        'B': '6,022×10²³',
        'C': '3,011×10²³',
        'D': '1,204×10²⁴',
        'E': '2,000×10²³',
      },
      correctAnswer: 'B',
      explanation: 'Definisi mol: 1 mol mengandung bilangan Avogadro (Nₐ) = 6,022×10²³ partikel.',
    ),
    QuestionModel(
      id: 'pre_002',
      type: 'pretest',
      materiId: 0,
      question: 'Mr CaCO₃ adalah ... (Ar: Ca=40, C=12, O=16)',
      options: {'A': '84', 'B': '96', 'C': '100', 'D': '104', 'E': '112'},
      correctAnswer: 'C',
      explanation: 'Mr CaCO₃ = 40 + 12 + 3×16 = 100 g·mol⁻¹.',
    ),
    QuestionModel(
      id: 'pre_003',
      type: 'pretest',
      materiId: 0,
      question: 'Jumlah mol (n) dari 18 g H₂O adalah ... (Mr H₂O = 18)',
      options: {'A': '0,5 mol', 'B': '1 mol', 'C': '2 mol', 'D': '18 mol', 'E': '36 mol'},
      correctAnswer: 'B',
      explanation: 'n = m/Mr = 18/18 = 1 mol.',
    ),
    QuestionModel(
      id: 'pre_004',
      type: 'pretest',
      materiId: 0,
      question: 'Jumlah molekul dalam 0,25 mol NH₃ adalah ...',
      options: {
        'A': '1,5055×10²³',
        'B': '6,022×10²³',
        'C': '2,4088×10²³',
        'D': '3,011×10²³',
        'E': '7,5275×10²³',
      },
      correctAnswer: 'A',
      explanation: 'Jumlah partikel = n × Nₐ = 0,25 × 6,022×10²³ = 1,5055×10²³ molekul.',
    ),
    QuestionModel(
      id: 'pre_005',
      type: 'pretest',
      materiId: 0,
      question: 'Pada STP, volume 1 mol gas ideal adalah ...',
      options: {'A': '2,24 L', 'B': '11,2 L', 'C': '22,4 L', 'D': '24,5 L', 'E': '44,8 L'},
      correctAnswer: 'C',
      explanation: 'Pada STP, volume molar gas = 22,4 L·mol⁻¹.',
    ),
    QuestionModel(
      id: 'pre_006',
      type: 'pretest',
      materiId: 0,
      question: 'Molaritas larutan yang mengandung 0,20 mol zat dalam 0,50 L adalah ...',
      options: {'A': '0,10 M', 'B': '0,20 M', 'C': '0,40 M', 'D': '2,5 M', 'E': '4,0 M'},
      correctAnswer: 'C',
      explanation: 'M = n/V = 0,20 / 0,50 = 0,40 mol·L⁻¹.',
    ),
    QuestionModel(
      id: 'pre_007',
      type: 'pretest',
      materiId: 0,
      question: 'Rumus menghitung mol (n) dari massa (m) dan Mr adalah ...',
      options: {'A': 'n = Mr / m', 'B': 'n = m × Mr', 'C': 'n = m / Mr', 'D': 'n = m + Mr', 'E': 'n = Mr − m'},
      correctAnswer: 'C',
      explanation: 'Mol dihitung dengan n = m/Mr.',
    ),
    QuestionModel(
      id: 'pre_008',
      type: 'pretest',
      materiId: 0,
      question: 'Jika Mr = 44 g·mol⁻¹, massa 2 mol zat tersebut adalah ...',
      options: {'A': '22 g', 'B': '44 g', 'C': '66 g', 'D': '88 g', 'E': '124 g'},
      correctAnswer: 'D',
      explanation: 'm = n × Mr = 2 × 44 = 88 g.',
    ),
    QuestionModel(
      id: 'pre_009',
      type: 'pretest',
      materiId: 0,
      question: 'Jika n = 3 mol, jumlah partikel = ...',
      options: {
        'A': '1,204×10²⁴',
        'B': '1,8066×10²⁴',
        'C': '6,022×10²³',
        'D': '3,011×10²³',
        'E': '9,033×10²³',
      },
      correctAnswer: 'B',
      explanation: 'Jumlah partikel = n × Nₐ = 3 × 6,022×10²³ = 1,8066×10²⁴.',
    ),
    QuestionModel(
      id: 'pre_010',
      type: 'pretest',
      materiId: 0,
      question: 'Pada STP, volume 2 mol gas ideal adalah ...',
      options: {'A': '11,2 L', 'B': '22,4 L', 'C': '44,8 L', 'D': '2,24 L', 'E': '224 L'},
      correctAnswer: 'C',
      explanation: 'V = n × 22,4 = 2 × 22,4 = 44,8 L.',
    ),
  ];

  // =========================
  // CHAPTER POST TEST (Materi 1..7)
  // Minimal contoh 3 soal per materi (kamu bisa tambah)
  // =========================
  static const Map<int, List<QuestionModel>> _chapterTests = {
    1: [
      QuestionModel(
        id: 'ch1_001',
        type: 'chapter_test',
        materiId: 1,
        question: 'Mol adalah satuan untuk menyatakan ...',
        options: {
          'A': 'massa zat',
          'B': 'jumlah zat',
          'C': 'volume zat',
          'D': 'konsentrasi zat',
          'E': 'temperatur zat',
        },
        correctAnswer: 'B',
        explanation: 'Mol adalah satuan SI untuk jumlah zat (amount of substance).',
      ),
      QuestionModel(
        id: 'ch1_002',
        type: 'chapter_test',
        materiId: 1,
        question: 'Hubungan yang benar antara mol (n), massa (m), dan Mr adalah ...',
        options: {
          'A': 'n = m/Mr',
          'B': 'n = Mr/m',
          'C': 'n = m×Mr',
          'D': 'n = m+Mr',
          'E': 'n = m−Mr',
        },
        correctAnswer: 'A',
        explanation: 'Rumus dasar: n = m/Mr.',
      ),
      QuestionModel(
        id: 'ch1_003',
        type: 'chapter_test',
        materiId: 1,
        question: 'Satuan massa molar adalah ...',
        options: {
          'A': 'g',
          'B': 'mol',
          'C': 'g·mol⁻¹',
          'D': 'mol·L⁻¹',
          'E': 'L·mol⁻¹',
        },
        correctAnswer: 'C',
        explanation: 'Massa molar dinyatakan dalam g·mol⁻¹.',
      ),
    ],
    2: [
      QuestionModel(
        id: 'ch2_001',
        type: 'chapter_test',
        materiId: 2,
        question: 'Bilangan Avogadro adalah ...',
        options: {
          'A': '6,022×10²³ partikel/mol',
          'B': '22,4 L/mol',
          'C': '1,0 L/mol',
          'D': '18 g/mol',
          'E': '0,5 mol/L',
        },
        correctAnswer: 'A',
        explanation: 'Nₐ = 6,022×10²³ partikel per mol.',
      ),
      QuestionModel(
        id: 'ch2_002',
        type: 'chapter_test',
        materiId: 2,
        question: 'Jumlah partikel untuk 0,5 mol adalah ...',
        options: {
          'A': '3,011×10²³',
          'B': '6,022×10²³',
          'C': '1,204×10²⁴',
          'D': '2,4088×10²³',
          'E': '9,033×10²³',
        },
        correctAnswer: 'A',
        explanation: '0,5 × 6,022×10²³ = 3,011×10²³.',
      ),
      QuestionModel(
        id: 'ch2_003',
        type: 'chapter_test',
        materiId: 2,
        question: 'Rumus jumlah partikel (N) dari mol (n) adalah ...',
        options: {
          'A': 'N = n/Nₐ',
          'B': 'N = Nₐ/n',
          'C': 'N = n×Nₐ',
          'D': 'N = n+m',
          'E': 'N = Mr×Nₐ',
        },
        correctAnswer: 'C',
        explanation: 'Jumlah partikel: N = n × Nₐ.',
      ),
    ],
    3: [
      QuestionModel(
        id: 'ch3_001',
        type: 'chapter_test',
        materiId: 3,
        question: 'Mr NH₃ adalah ... (Ar: N=14, H=1)',
        options: {'A': '14', 'B': '15', 'C': '16', 'D': '17', 'E': '18'},
        correctAnswer: 'D',
        explanation: 'Mr NH₃ = 14 + 3×1 = 17.',
      ),
      QuestionModel(
        id: 'ch3_002',
        type: 'chapter_test',
        materiId: 3,
        question: 'Massa molar CaCO₃ adalah ...',
        options: {'A': '50', 'B': '84', 'C': '100', 'D': '116', 'E': '120'},
        correctAnswer: 'C',
        explanation: 'Mr CaCO₃ = 100 g·mol⁻¹.',
      ),
      QuestionModel(
        id: 'ch3_003',
        type: 'chapter_test',
        materiId: 3,
        question: 'Jika Mr suatu senyawa = 32, maka massa 0,5 mol adalah ...',
        options: {'A': '8 g', 'B': '16 g', 'C': '32 g', 'D': '64 g', 'E': '0,016 g'},
        correctAnswer: 'B',
        explanation: 'm = n×Mr = 0,5×32 = 16 g.',
      ),
    ],
    4: [
      QuestionModel(
        id: 'ch4_001',
        type: 'chapter_test',
        materiId: 4,
        question: 'Jika massa zat 10 g dan Mr 20, maka jumlah mol adalah ...',
        options: {'A': '0,2', 'B': '0,5', 'C': '2', 'D': '10', 'E': '200'},
        correctAnswer: 'B',
        explanation: 'n = m/Mr = 10/20 = 0,5 mol.',
      ),
      QuestionModel(
        id: 'ch4_002',
        type: 'chapter_test',
        materiId: 4,
        question: '0,25 mol setara dengan jumlah partikel ...',
        options: {
          'A': '1,5055×10²³',
          'B': '6,022×10²³',
          'C': '3,011×10²³',
          'D': '2,4088×10²³',
          'E': '9,033×10²³',
        },
        correctAnswer: 'A',
        explanation: '0,25×6,022×10²³ = 1,5055×10²³.',
      ),
      QuestionModel(
        id: 'ch4_003',
        type: 'chapter_test',
        materiId: 4,
        question: 'Jika n = 2 mol, maka jumlah partikel adalah ...',
        options: {
          'A': '6,022×10²³',
          'B': '1,2044×10²⁴',
          'C': '3,011×10²³',
          'D': '2,4088×10²³',
          'E': '9,033×10²³',
        },
        correctAnswer: 'B',
        explanation: '2×6,022×10²³ = 1,2044×10²⁴.',
      ),
    ],
    5: [
      QuestionModel(
        id: 'ch5_001',
        type: 'chapter_test',
        materiId: 5,
        question: 'Pada STP, volume 1 mol gas ideal adalah ...',
        options: {'A': '11,2 L', 'B': '22,4 L', 'C': '44,8 L', 'D': '2,24 L', 'E': '224 L'},
        correctAnswer: 'B',
        explanation: 'Volume molar gas pada STP = 22,4 L·mol⁻¹.',
      ),
      QuestionModel(
        id: 'ch5_002',
        type: 'chapter_test',
        materiId: 5,
        question: 'Pada STP, volume 2 mol gas ideal adalah ...',
        options: {'A': '11,2 L', 'B': '22,4 L', 'C': '44,8 L', 'D': '2,24 L', 'E': '224 L'},
        correctAnswer: 'C',
        explanation: 'V = n×22,4 = 2×22,4 = 44,8 L.',
      ),
      QuestionModel(
        id: 'ch5_003',
        type: 'chapter_test',
        materiId: 5,
        question: 'Pada STP, volume 0,5 mol gas ideal adalah ...',
        options: {'A': '5,6 L', 'B': '11,2 L', 'C': '22,4 L', 'D': '44,8 L', 'E': '1,12 L'},
        correctAnswer: 'B',
        explanation: '0,5×22,4 = 11,2 L.',
      ),
    ],
    6: [
      QuestionModel(
        id: 'ch6_001',
        type: 'chapter_test',
        materiId: 6,
        question: 'Rumus molaritas yang benar adalah ...',
        options: {'A': 'M = V/n', 'B': 'M = n/V', 'C': 'M = m/V', 'D': 'M = Mr/V', 'E': 'M = n×V'},
        correctAnswer: 'B',
        explanation: 'M = n/V (mol·L⁻¹).',
      ),
      QuestionModel(
        id: 'ch6_002',
        type: 'chapter_test',
        materiId: 6,
        question: 'Larutan NH₃ 0,50 mol dalam 1,0 L memiliki molaritas ...',
        options: {'A': '0,05 M', 'B': '0,50 M', 'C': '1,0 M', 'D': '2,0 M', 'E': '5,0 M'},
        correctAnswer: 'B',
        explanation: 'M = n/V = 0,50/1,0 = 0,50 M.',
      ),
      QuestionModel(
        id: 'ch6_003',
        type: 'chapter_test',
        materiId: 6,
        question: 'Jika 0,20 mol dilarutkan menjadi 0,50 L, maka M = ...',
        options: {'A': '0,10', 'B': '0,20', 'C': '0,40', 'D': '2,5', 'E': '4,0'},
        correctAnswer: 'C',
        explanation: '0,20/0,50 = 0,40 mol·L⁻¹.',
      ),
    ],
    7: [
      QuestionModel(
        id: 'ch7_001',
        type: 'chapter_test',
        materiId: 7,
        question: 'Rumus empiris adalah ...',
        options: {
          'A': 'rumus paling kompleks',
          'B': 'rumus perbandingan mol paling sederhana',
          'C': 'rumus konsentrasi',
          'D': 'rumus volume gas',
          'E': 'rumus Mr',
        },
        correctAnswer: 'B',
        explanation: 'Rumus empiris menyatakan perbandingan mol paling sederhana.',
      ),
      QuestionModel(
        id: 'ch7_002',
        type: 'chapter_test',
        materiId: 7,
        question: 'Langkah awal menentukan rumus empiris dari data massa adalah ...',
        options: {'A': 'ubah ke volume', 'B': 'ubah ke mol', 'C': 'kali Mr', 'D': 'bagi 22,4', 'E': 'jumlahkan Ar'},
        correctAnswer: 'B',
        explanation: 'Data massa diubah menjadi mol terlebih dahulu.',
      ),
      QuestionModel(
        id: 'ch7_003',
        type: 'chapter_test',
        materiId: 7,
        question: 'Rumus molekul biasanya merupakan ... dari rumus empiris.',
        options: {'A': 'pecahan', 'B': 'kelipatan', 'C': 'akar', 'D': 'logaritma', 'E': 'selisih'},
        correctAnswer: 'B',
        explanation: 'Rumus molekul = k × rumus empiris.',
      ),
    ],
  };

  // =========================
  // POSTTEST (contoh 10)
  // =========================
  static const List<QuestionModel> _posttest = [
    QuestionModel(
      id: 'post_001',
      type: 'posttest',
      materiId: 0,
      question: 'Jika massa 0,5 mol CaCO₃ (Mr=100) adalah ...',
      options: {'A': '5 g', 'B': '50 g', 'C': '100 g', 'D': '150 g', 'E': '200 g'},
      correctAnswer: 'B',
      explanation: 'm = n×Mr = 0,5×100 = 50 g.',
    ),
    QuestionModel(
      id: 'post_002',
      type: 'posttest',
      materiId: 0,
      question: 'Jumlah partikel pada 2 mol zat adalah ...',
      options: {
        'A': '6,022×10²³',
        'B': '1,2044×10²⁴',
        'C': '3,011×10²³',
        'D': '2,4088×10²³',
        'E': '9,033×10²³',
      },
      correctAnswer: 'B',
      explanation: '2×6,022×10²³ = 1,2044×10²⁴.',
    ),
    // Tambahkan sampai 10 sesuai kebutuhan
  ];

  // =========================
  // ADVENTURE / TRAINING (contoh)
  // =========================
  static const List<QuestionModel> _adventure = [
    QuestionModel(
      id: 'adv_001',
      type: 'adventure',
      materiId: 0,
      question: 'Pada STP, volume 3 mol gas ideal adalah ...',
      options: {'A': '22,4 L', 'B': '33,6 L', 'C': '44,8 L', 'D': '67,2 L', 'E': '224 L'},
      correctAnswer: 'D',
      explanation: 'V = 3×22,4 = 67,2 L.',
    ),
  ];

  static const List<QuestionModel> _training = [
    QuestionModel(
      id: 'tr_001',
      type: 'training',
      materiId: 0,
      question: 'Jika m = 24 g dan Mr = 12, maka n = ...',
      options: {'A': '0,5', 'B': '1', 'C': '2', 'D': '12', 'E': '288'},
      correctAnswer: 'C',
      explanation: 'n = m/Mr = 24/12 = 2 mol.',
    ),
  ];
}