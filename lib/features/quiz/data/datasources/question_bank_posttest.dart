import '../models/question_model.dart';

const List<QuestionModel> posttestQuestions = [
    QuestionModel(
      id: 'post_001',
      type: 'posttest',
      materiId: 0,
      question:
          'Jika 11,2 L gas O₂ diukur pada STP, maka jumlah atom oksigen di dalam gas tersebut adalah ....',
      options: {
        'A': '3,01 × 10²³ atom',
        'B': '6,02 × 10²³ atom',
        'C': '1,20 × 10²³ atom',
        'D': '3,01 × 10²⁴ atom',
        'E': '1,20 × 10²⁴ atom',
      },
      correctAnswer: 'B',
      explanation:
          r'$$n = \frac{11,2}{22,4} = 0,5\ mol$$'
          r'$$Jumlah\ molekul = 0,5 \times 6,022 \times 10^{23} = 3,01 \times 10^{23}$$'
          r'$$Jumlah\ atom\ O = 2 \times 3,01 \times 10^{23} = 6,02 \times 10^{23}$$',
    ),

    QuestionModel(
      id: 'post_002',
      type: 'posttest',
      materiId: 0,
      question:
          'Tubuh manusia menghasilkan sekitar 44 g CO₂ setiap kali bernapas selama 1 menit. '
          'Berapa mol CO₂ yang dihasilkan?',
      options: {
        'A': '0,5 mol',
        'B': '0,1 mol',
        'C': '2,0 mol',
        'D': '1,0 mol',
        'E': '0,25 mol',
      },
      correctAnswer: 'D',
      explanation:
          r'$$n = \frac{massa}{Mr} = \frac{44}{44} = 1\ mol$$',
    ),

    QuestionModel(
      id: 'post_003',
      type: 'posttest',
      materiId: 0,
      question:
          'Sebanyak 4,6 g natrium (Ar Na = 23) direaksikan dengan air. '
          'Volume gas H₂ yang dihasilkan pada STP adalah ....',
      options: {
        'A': '2,24 L',
        'B': '1,12 L',
        'C': '0,56 L',
        'D': '3,36 L',
        'E': '4,48 L',
      },
      correctAnswer: 'A',
      explanation:
          r'$$n\ Na = \frac{4,6}{23} = 0,2\ mol$$'
          r'$$n\ H_2 = \frac{1}{2} \times 0,2 = 0,1\ mol$$'
          r'$$V = 0,1 \times 22,4 = 2,24\ L$$',
    ),

    QuestionModel(
      id: 'post_004',
      type: 'posttest',
      materiId: 0,
      question:
          'Jumlah molekul air yang terdapat dalam 9 g H₂O adalah ....',
      options: {
        'A': '3,01 × 10²² molekul',
        'B': '6,02 × 10²² molekul',
        'C': '1,20 × 10²³ molekul',
        'D': '6,02 × 10²³ molekul',
        'E': '3,01 × 10²³ molekul',
      },
      correctAnswer: 'C',
      explanation:
          r'$$n = \frac{9}{18} = 0,5\ mol$$'
          r'$$Jumlah\ molekul = 0,5 \times 6,022 \times 10^{23}$$'
          r'$$= 3,01 \times 10^{23} \approx 1,20 \times 10^{23}$$',
    ),

    QuestionModel(
      id: 'post_005',
      type: 'posttest',
      materiId: 0,
      question:
          'Dua tabung gas berisi 2 L H₂ dan 1 L O₂ pada suhu dan tekanan sama. '
          'Jika bereaksi membentuk uap air, volume H₂O yang terbentuk adalah ....',
      options: {
        'A': '1 L',
        'B': '2 L',
        'C': '3 L',
        'D': '4 L',
        'E': '5 L',
      },
      correctAnswer: 'E',
      explanation:
          r'$$2H_2 + O_2 \rightarrow 2H_2O$$'
          r'$$Perbandingan\ volume\ H_2 : H_2O = 2 : 2$$'
          r'$$Volume\ H_2O = 2\ L$$',
    ),

    QuestionModel(
      id: 'post_006',
      type: 'posttest',
      materiId: 0,
      question:
          'Jika 100 mL larutan NaCl 0,5 M diuapkan seluruhnya, '
          'massa NaCl yang tersisa adalah ....',
      options: {
        'A': '3,50 g',
        'B': '2,93 g',
        'C': '5,85 g',
        'D': '1,46 g',
        'E': '1,17 g',
      },
      correctAnswer: 'B',
      explanation:
          r'$$n = 0,5 \times 0,1 = 0,05\ mol$$'
          r'$$m = 0,05 \times 58,5 = 2,93\ g$$',
    ),

    QuestionModel(
      id: 'post_007',
      type: 'posttest',
      materiId: 0,
      question:
          'Jumlah ion total dalam 0,2 mol CaCl₂ adalah ....',
      options: {
        'A': '6,02 × 10²² ion',
        'B': '1,81 × 10²⁴ ion',
        'C': '3,01 × 10²³ ion',
        'D': '6,02 × 10²³ ion',
        'E': '9,03 × 10²³ ion',
      },
      correctAnswer: 'C',
      explanation:
          r'$$CaCl_2 \rightarrow Ca^{2+} + 2Cl^-$$'
          r'$$n\ ion = 3 \times 0,2 = 0,6\ mol$$'
          r'$$Jumlah\ ion = 0,6 \times 6,022 \times 10^{23}$$',
    ),

    QuestionModel(
      id: 'post_008',
      type: 'posttest',
      materiId: 0,
      question:
          'Sebanyak 1,12 L gas NH₃ diukur pada STP. Massa gas tersebut adalah ....',
      options: {
        'A': '0,43 g',
        'B': '0,85 g',
        'C': '1,70 g',
        'D': '2,55 g',
        'E': '3,40 g',
      },
      correctAnswer: 'B',
      explanation:
          r'$$n = \frac{1,12}{22,4} = 0,05\ mol$$'
          r'$$m = 0,05 \times 17 = 0,85\ g$$',
    ),

    QuestionModel(
      id: 'post_009',
      type: 'posttest',
      materiId: 0,
      question:
          'Jika 10 g CaCO₃ direaksikan dengan HCl berlebih, '
          'volume gas CO₂ yang dihasilkan pada STP adalah ....',
      options: {
        'A': '1,12 L',
        'B': '3,36 L',
        'C': '2,24 L',
        'D': '4,48 L',
        'E': '5,60 L',
      },
      correctAnswer: 'D',
      explanation:
          r'$$n\ CaCO_3 = \frac{10}{100} = 0,1\ mol$$'
          r'$$V = 0,1 \times 22,4 = 2,24\ L$$',
    ),

    QuestionModel(
      id: 'post_010',
      type: 'posttest',
      materiId: 0,
      question:
          'Seorang siswa bernama Rafi sedang melakukan praktikum kimia. Ia diminta menyiapkan larutan garam dapur (NaCl) untuk percobaan elektrolisis. Rafi melarutkan 2,93 gram NaCl padat ke dalam air hingga volumenya tepat 100 mL.'
          'Setelah selesai, ia bertanya-tanya:  Jika setiap 1 molekul NaCl akan terurai menjadi ion Na⁺ dan Cl⁻ di dalam air, berapa banyak ion total yang sekarang ada dalam larutan yang kubuat ini? (Ar Na = 23, Cl = 35,5; Bilangan Avogadro = 6,02 × 10²³)',
      options: {
        'A': '3,01 × 10²² ion',
        'B': '6,02 × 10²² ion',
        'C': '9,03 × 10²² ion',
        'D': '1,20 × 10²³ ion',
        'E': '3,01 × 10²³ ion',
      },
      correctAnswer: 'C',
      explanation:
          r'$$n\ NaCl = \frac{2,93}{58,5} = 0,05\ mol$$'
          r'$$n\ ion = 2 \times 0,05 = 0,1\ mol$$'
          r'$$Jumlah\ ion = 0,1 \times 6,022 \times 10^{23}$$',
    ),
  ];