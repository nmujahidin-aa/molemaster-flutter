import '../models/question_model.dart';

const Map<int, List<QuestionModel>> chapterTestQuestions = {
  1: [
    QuestionModel(
      id: 'ch1_001',
      type: 'chapter_test',
      materiId: 1,
      question: 'Berapa banyak mol CO₂ yang mengandung 1,204 × 10¹⁸ molekul CO₂ ?',
      options: {
        'A': 'A. 2,00 × 10⁻⁶ mol',
        'B': '2,00 × 10⁻⁵ mol',
        'C': '2,00 × 10⁻⁶ mol',
        'D': '1,00 × 10⁻⁵ mol',
        'E': '1,20 × 10⁻⁶ mol',
      },
      correctAnswer: 'C',
      explanation:
        'Jumlah partikel (X) = mol (n) × 6,022×10²³ (Nₐ)\n\n'
        r'$$n_{\mathrm{CO_2}}=\frac{\text{jumlah partikel}}{N_A}'
        r'=\frac{1.204\times 10^{18}}{6.022\times 10^{23}}'
        r'\approx 2\times 10^{-6}\ \mathrm{mol}$$',
    ),
    QuestionModel(
      id: 'ch1_002',
      type: 'chapter_test',
      materiId: 1,
      question: 'Suatu asam cuka (CH₃COOH) 0,01 mol mengandung atom karbon sebanyak?',
      options: {
        'A': '6,02 × 10²¹ atom',
        'B': '6,02 × 10²⁰ atom',
        'C': '1,204 × 10²⁰ atom',
        'D': '1,204 × 10²² atom',
        'E': '1,204 × 10²¹ atom',
      },
      correctAnswer: 'D',
      explanation: 
        'CH₃COOH punya 2 atom C per molekul, sehingga:\n'
        '0,01 mol × 2 = 0,02 mol \n'
        'mol × NA = 0,02 × 6,02 × 10²³ = 1,204 × 10²²',
    ),
    QuestionModel(
      id: 'ch1_003',
      type: 'chapter_test',
      materiId: 1,
      question: 'Dalam 10 mol senyawa ion Na₂CO₃, banyaknya ion Na⁺ dan CO₃²⁻ adalah sebanyak?',
      options: {
        'A': 'Na⁺ = 10 mol dan CO₃²⁻ = 5 mol',
        'B': 'Na⁺ = 5 mol dan CO₃²⁻ = 10 mol',
        'C': 'Na⁺ = 15 mol dan CO₃²⁻ = 5 mol',
        'D': 'Na⁺ = 10 mol dan CO₃²⁻ = 10 mol',
        'E': 'Na⁺ = 20 mol dan CO₃²⁻ = 10 mol',
      },
      correctAnswer: 'E',
      explanation: 
      'Na₂CO₃ → 2Na⁺ + CO₃²⁻\n'
      'Agar total muatan netral, dibutuhkan 2 Na⁺ untuk menyeimbangkan 1 CO₃²⁻. Artinya: 1 mol Na₂CO₃ menghasilkan 2 mol Na⁺ dan 1 mol CO₃²⁻.\n'
      'Sehingga, untuk 10 mol Na₂CO₃:\n'
      '- Ion Na⁺ = 10 × 2 = 20 mol\n'
      '- Ion CO₃²⁻ = 10 × 1 = 10 mol',
    ),
    QuestionModel(
      id: 'ch1_004',
      type: 'chapter_test',
      materiId: 1,
      question: 'Dalam 5 mol C₆H₁₂O₆ , berapa banyaknya atom C, H, dan O secara berurutan?',
      options: {
        'A': '1,81 × 10²⁵ atom C ; 6,02 × 10²⁵ atom H ; 1,81 × 10²⁵ atom O',
        'B': '1,81 × 10²⁵ atom C ; 3,61 × 10²⁵ atom H ; 1,81 × 10²⁵ atom O',
        'C': '3,01 × 10²⁴ atom C ; 6,02 × 10²⁴ atom H ; 3,01 × 10²⁴ atom O',
        'D': '1,20 × 10²⁶ atom C ; 2,40 × 10²⁶ atom H ; 1,20 × 10²⁶ atom O',
        'E': '6,02 × 10²⁴ atom C ; 1,20 × 10²⁵ atom H ; 6,02 × 10²⁴ atom O',
      },
      correctAnswer: 'B',
      explanation: 
      'Diketahui dalam 1 molekul, jumlah atom C = 6, H = 12, dan O = 6 \nUntuk 5 mol C₆H₁₂O₆\n'
      '- Atom C = 5 × 6 = 30 mol atom\n'
      '- Atom H = 5 × 12 = 60 mol atom\n'
      '- Atom O = 5 × 6 = 30 mol atom\n'
      'Jumlah partikel (X) = mol (n) x 6,022 x 10²³ (NA)\n'
      'Atom C: mol (n) × 6,022 × 10²³ = 30 mol × 6,022 × 10²³ = 1,81 × 10²⁵\n'
      'Atom H: mol (n) × 6,022 × 10²³ = 60 mol × 6,022 × 10²³ = 3,61 × 10²⁵\n'
      'Atom O: mol (n) × 6,022 × 10²³ = 30 mol × 6,022 × 10²³ = 1,81 × 10²⁵\n',
    ),
    QuestionModel(
      id: 'ch1_005',
      type: 'chapter_test',
      materiId: 1,
      question: 'Unsur besi mengandung 4,816 × 10²⁴ atom besi, maka berapa harga mol unsur tersebut?',
      options: {
        'A': '6,02 mol',
        'B': '8,00 mol',
        'C': '8,00 mol',
        'D': '0,80 mol',
        'E': '12,0 mol',
      },
      correctAnswer: 'C',
      explanation: 
      'Jumlah partikel (X) = mol (n) × 6,022×10²³ (Nₐ)\n\n'
        r'$$n_{{Fe}}=\frac{\text{jumlah partikel}}{N_A}'
        r'=\frac{4.816\times 10^{24}}{6.022\times 10^{23}}'
        r'\approx 8\ \mathrm{mol}$$',
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