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
      question: 'Jika diketahui Ar N = 14, H = 1, S = 32, dan O = 16, maka Mr (NH₄)₃SO₄ adalah ....',
      options: {
        'A': '152 g/mol',
        'B': '142 g/mol',
        'C': '132 g/mol',
        'D': '122 g/mol',
        'E': '112 g/mol',
      },
      correctAnswer: 'C',
      explanation:
          'Mr = jumlah dari Ar\n\n'
          r'$$'
          r'Mr = (3 \times 14) + (12 \times 1) + 32 + (4 \times 16)'
          r'= 132\ \text{g/mol}'
          r'$$',
    ),

    QuestionModel(
      id: 'ch2_002',
      type: 'chapter_test',
      materiId: 2,
      question:
          'Satu gram zat berikut yang mengandung jumlah molekul paling sedikit adalah ....',
      options: {
        'A': 'CH₄',
        'B': 'CO₂',
        'C': 'CO₂',
        'D': 'NO',
        'E': 'NH₃',
      },
      correctAnswer: 'B',
      explanation:
          'Jumlah molekul berbanding terbalik dengan Mr.\n\n'
          r'$$'
          r'n = \frac{massa}{Mr}'
          r'$$'
          '\nZat dengan Mr terbesar memiliki jumlah molekul paling sedikit.\n'
          'Mr CO₂ = 44 g/mol (paling besar).',
    ),

    QuestionModel(
      id: 'ch2_003',
      type: 'chapter_test',
      materiId: 2,
      question:
          'Suatu senyawa L₃(PO₄)₂ mempunyai Mr = 310. Nilai Ar unsur L adalah ....',
      options: {
        'A': '56',
        'B': '52',
        'C': '40',
        'D': '26',
        'E': '23',
      },
      correctAnswer: 'C',
      explanation:
          r'$$'
          r'310 = (3 \times Ar_L) + (2 \times 31) + (8 \times 16)'
          r'$$'
          r'$$'
          r'310 - 190 = 3Ar_L'
          r'$$'
          r'$$'
          r'Ar_L = \frac{120}{3} = 40'
          r'$$',
    ),

    QuestionModel(
      id: 'ch2_004',
      type: 'chapter_test',
      materiId: 2,
      question:
          'Jika Ar Fe = 56 sma dan massa 1 atom C-12 = 2 × 10⁻²³ gram, maka massa 10 atom besi adalah ....',
      options: {
        'A': '3,3 × 10⁻²³ gram',
        'B': '9,3 × 10⁻²³ gram',
        'C': '12,3 × 10⁻²³ gram',
        'D': '33 × 10⁻²³ gram',
        'E': '93 × 10⁻²³ gram',
      },
      correctAnswer: 'E',
      explanation:
          r'$$'
          r'1\ sma = \frac{2 \times 10^{-23}}{12} = \frac{1}{6} \times 10^{-23}'
          r'$$'
          r'$$'
          r'massa\ 1\ atom\ Fe = 56 \times \frac{1}{6} \times 10^{-23}'
          r'$$'
          r'$$'
          r'massa\ 10\ atom\ Fe = 93 \times 10^{-23}\ gram'
          r'$$',
    ),

    QuestionModel(
      id: 'ch2_005',
      type: 'chapter_test',
      materiId: 2,
      question:
          'Jika diketahui Ar H = 1, Cu = 64, S = 32, dan O = 16, maka Mr dari CuSO₄·5H₂O adalah ....',
      options: {
        'A': '100 g/mol',
        'B': '150 g/mol',
        'C': '200 g/mol',
        'D': '250 g/mol',
        'E': '300 g/mol',
      },
      correctAnswer: 'D',
      explanation:
          r'$$'
          r'Mr\ CuSO_4 = 64 + 32 + (4 \times 16) = 160'
          r'$$'
          r'$$'
          r'Mr\ H_2O = 18,\quad 5H_2O = 5 \times 18 = 90'
          r'$$'
          r'$$'
          r'Mr\ total = 160 + 90 = 250\ g/mol'
          r'$$',
    ),
  ],
  3: [
    QuestionModel(
      id: 'ch3_001',
      type: 'chapter_test',
      materiId: 3,
      question:
          'Senyawa berikut yang mengandung jumlah molekul paling banyak yaitu ....',
      options: {
        'A': '10 g C₂H₆ (Mr = 30 g/mol)',
        'B': '11 g CO₂ (Mr = 44 g/mol)',
        'C': '12 g NO₂ (Mr = 46 g/mol)',
        'D': '17 g Cl₂ (Mr = 71 g/mol)',
        'E': '20 g C₆H₆ (Mr = 78 g/mol)',
      },
      correctAnswer: 'A',
      explanation:
          'Gunakan rumus:\n'
          r'$$n = \frac{massa}{Mr}$$'
          '\n'
          r'$$n_{C_2H_6}=\frac{10}{30}=0,33\ \text{mol}$$'
          r'$$n_{CO_2}=\frac{11}{44}=0,25\ \text{mol}$$'
          r'$$n_{NO_2}=\frac{12}{46}=0,26\ \text{mol}$$'
          r'$$n_{Cl_2}=\frac{17}{71}=0,24\ \text{mol}$$'
          r'$$n_{C_6H_6}=\frac{20}{78}=0,26\ \text{mol}$$'
          '\nJumlah molekul sebanding dengan jumlah mol.\n'
          'Mol terbesar adalah C₂H₆.',
    ),

    QuestionModel(
      id: 'ch3_002',
      type: 'chapter_test',
      materiId: 3,
      question:
          'Diketahui Ar C = 12, O = 16, Na = 23, dan S = 32. Gas-gas berikut ini mempunyai massa 32 gram, kecuali ....',
      options: {
        'A': '0,4 mol SO₃',
        'B': '0,5 mol C₄H₁₀',
        'C': '2 mol CH₄',
        'D': '1 mol O₂',
        'E': '0,5 mol SO₂',
      },
      correctAnswer: 'B',
      explanation:
          'Gunakan rumus:\n'
          r'$$massa = n \times Mr$$'
          '\n'
          r'$$Mr\ SO_3 = 32 + (3 \times 16) = 80$$'
          r'$$massa\ SO_3 = 0,4 \times 80 = 32\ g$$'
          r'$$Mr\ C_4H_{10} = (4 \times 12) + (10 \times 1) = 58$$'
          r'$$massa\ C_4H_{10} = 0,5 \times 58 = 29\ g$$'
          '\nMassa tidak sama dengan 32 gram.',
    ),

    QuestionModel(
      id: 'ch3_003',
      type: 'chapter_test',
      materiId: 3,
      question:
          'Massa besi dalam 0,25 mol Fe₂O₃ adalah .... (Ar Fe = 56, Ar O = 16)',
      options: {
        'A': '80 gram',
        'B': '28 gram',
        'C': '30,1 gram',
        'D': '15,5 gram',
        'E': '4 gram',
      },
      correctAnswer: 'B',
      explanation:
          r'$$Mr\ Fe_2O_3 = (2 \times 56) + (3 \times 16) = 160$$'
          r'$$massa\ Fe_2O_3 = 0,25 \times 160 = 40\ g$$'
          r'$$'
          r'massa\ Fe = \frac{112}{160} \times 40 = 28\ g'
          r'$$',
    ),

    QuestionModel(
      id: 'ch3_004',
      type: 'chapter_test',
      materiId: 3,
      question:
          'Jumlah mol dari 29,8 gram amonium fosfat (NH₄)₃PO₄ adalah ....',
      options: {
        'A': '0,05 mol',
        'B': '0,25 mol',
        'C': '0,15 mol',
        'D': '1,10 mol',
        'E': '0,20 mol',
      },
      correctAnswer: 'E',
      explanation:
          r'$$Mr\ (NH_4)_3PO_4 = (3 \times 14) + (12 \times 1) + 31 + (4 \times 16)$$'
          r'$$= 149\ g/mol$$'
          r'$$n = \frac{29,8}{149} = 0,2\ \text{mol}$$',
    ),

    QuestionModel(
      id: 'ch3_005',
      type: 'chapter_test',
      materiId: 3,
      question:
          'Jika diketahui Ar Ca = 40, C = 12, O = 16 dan bilangan Avogadro = 6,02 × 10²³, maka 50 gram CaCO₃ mempunyai jumlah molekul ....',
      options: {
        'A': '3,01 × 10²¹ molekul',
        'B': '3,01 × 10²² molekul',
        'C': '6,02 × 10²² molekul',
        'D': '3,10 × 10²³ molekul',
        'E': '1,204 × 10²³ molekul',
      },
      correctAnswer: 'D',
      explanation:
          r'$$Mr\ CaCO_3 = 40 + 12 + (3 \times 16) = 100$$'
          r'$$n = \frac{50}{100} = 0,5\ \text{mol}$$'
          r'$$'
          r'Jumlah\ molekul = 0,5 \times 6,02 \times 10^{23}'
          r'= 3,10 \times 10^{23}'
          r'$$',
    ),
  ],
  4: [
    QuestionModel(
      id: 'ch4_001',
      type: 'chapter_test',
      materiId: 4,
      question:
          'Jika Ar C = 12 dan O = 16, maka volume dari 8,8 gram gas CO₂ pada keadaan standar (STP) adalah ....',
      options: {
        'A': '2,24 L',
        'B': '4,48 L',
        'C': '8,96 L',
        'D': '22,4 L',
        'E': '6,72 L',
      },
      correctAnswer: 'B',
      explanation:
          r'$$Mr\ CO_2 = 12 + (2 \times 16) = 44\ g/mol$$'
          r'$$n = \frac{8,8}{44} = 0,2\ mol$$'
          r'$$V = n \times V_m = 0,2 \times 22,4 = 4,48\ L$$',
    ),

    QuestionModel(
      id: 'ch4_002',
      type: 'chapter_test',
      materiId: 4,
      question:
          'Berdasarkan reaksi FeS₂(g) + O₂(g) → Fe₂O₃(g) + SO₂(g), massa FeS₂ yang harus dibakar agar diperoleh 2,24 liter gas SO₂ pada STP adalah ....',
      options: {
        'A': '3 gram',
        'B': '4,5 gram',
        'C': '6 gram',
        'D': '7,5 gram',
        'E': '9 gram',
      },
      correctAnswer: 'C',
      explanation:
          r'$$4FeS_2 + 11O_2 \rightarrow 2Fe_2O_3 + 8SO_2$$'
          r'$$n\ SO_2 = \frac{2,24}{22,4} = 0,1\ mol$$'
          r'$$\frac{4}{8} = \frac{n\ FeS_2}{0,1} \Rightarrow n\ FeS_2 = 0,05\ mol$$'
          r'$$Mr\ FeS_2 = 56 + (2 \times 32) = 120$$'
          r'$$massa\ FeS_2 = 0,05 \times 120 = 6\ gram$$',
    ),

    QuestionModel(
      id: 'ch4_003',
      type: 'chapter_test',
      materiId: 4,
      question:
          'Berapa selisih volume 0,16 gram gas metana pada tekanan 4 atm dan suhu 27°C dengan volume gas metana pada keadaan standar?',
      options: {
        'A': '0,16 L',
        'B': '0,224 L',
        'C': '0,06 L',
        'D': '0,28 L',
        'E': '0,08 L',
      },
      correctAnswer: 'A',
      explanation:
          r'$$Mr\ CH_4 = 12 + (4 \times 1) = 16$$'
          r'$$n = \frac{0,16}{16} = 0,01\ mol$$'
          r'$$V_1 = \frac{nRT}{P} = \frac{0,01 \times 0,082 \times 300}{4} = 0,0615\ L$$'
          r'$$V_{STP} = 0,01 \times 22,4 = 0,224\ L$$'
          r'$$\Delta V = 0,224 - 0,0615 \approx 0,16\ L$$',
    ),

    QuestionModel(
      id: 'ch4_004',
      type: 'chapter_test',
      materiId: 4,
      question:
          'Berapa jumlah molekul dari 14,80 liter gas hidrogen yang diukur pada suhu 28°C dan tekanan 1 atm?',
      options: {
        'A': '3,604 × 10²³ molekul H₂',
        'B': '1,802 × 10²³ molekul H₂',
        'C': '7,208 × 10²³ molekul H₂',
        'D': '36,04 × 10²³ molekul H₂',
        'E': '18,02 × 10²³ molekul H₂',
      },
      correctAnswer: 'A',
      explanation:
          r'$$n = \frac{PV}{RT} = \frac{1 \times 14,80}{0,082 \times 301} = 0,6\ mol$$'
          r'$$Jumlah\ molekul = 0,6 \times 6,022 \times 10^{23}$$'
          r'$$= 3,604 \times 10^{23}$$',
    ),

    QuestionModel(
      id: 'ch4_005',
      type: 'chapter_test',
      materiId: 4,
      question:
          'Volume dari 2,8 gram gas nitrogen yang diukur pada suhu 25°C dan tekanan 0,5 atm adalah ....',
      options: {
        'A': '30,0 L',
        'B': '22,4 L',
        'C': '24,44 L',
        'D': '28,25 L',
        'E': '4,89 L',
      },
      correctAnswer: 'E',
      explanation:
          r'$$Mr\ N_2 = 2 \times 14 = 28$$'
          r'$$n = \frac{2,8}{28} = 0,1\ mol$$'
          r'$$V = \frac{nRT}{P} = \frac{0,1 \times 0,082 \times 298}{0,5}$$'
          r'$$= 4,89\ L$$',
    ),
  ],
  5: [
    QuestionModel(
      id: 'ch5_001',
      type: 'chapter_test',
      materiId: 5,
      question:
          'Pada suhu dan tekanan tertentu, volume 1 gram gas NO = 1,28 liter. '
          'Pada keadaan yang sama, volume gas yang dihasilkan pada pembakaran sempurna '
          '4 gram belerang adalah ....',
      options: {
        'A': '3,6 L',
        'B': '4,8 L',
        'C': '5,12 L',
        'D': '10,24 L',
        'E': '293 L',
      },
      correctAnswer: 'B',
      explanation:
          r'$$Mr\ NO = 14 + 16 = 30\ g/mol$$'
          r'$$n\ NO = \frac{1}{30}\ mol$$'
          r'$$1,28 = \frac{1}{30} \times V_m \Rightarrow V_m = 38,4\ L/mol$$'
          r'$$n\ S = \frac{4}{32} = 0,125\ mol$$'
          r'$$n\ SO_2 = n\ S = 0,125\ mol$$'
          r'$$V\ SO_2 = 0,125 \times 38,4 = 4,8\ L$$',
    ),

    QuestionModel(
      id: 'ch5_002',
      type: 'chapter_test',
      materiId: 5,
      question:
          'Pada suhu dan tekanan tertentu, 5 liter gas H₂ mempunyai massa 0,4 gram. '
          'Pada suhu dan tekanan yang sama, 10 liter gas X massanya 28 gram. '
          'Jika Ar H = 1, maka massa molekul relatif gas X adalah ....',
      options: {
        'A': '30 g/mol',
        'B': '60 g/mol',
        'C': '40 g/mol',
        'D': '70 g/mol',
        'E': '50 g/mol',
      },
      correctAnswer: 'D',
      explanation:
          r'$$Mr\ H_2 = 2$$'
          r'$$n\ H_2 = \frac{0,4}{2} = 0,2\ mol$$'
          r'$$\frac{n_X}{0,2} = \frac{10}{5} \Rightarrow n_X = 0,4\ mol$$'
          r'$$Mr\ X = \frac{28}{0,4} = 70\ g/mol$$',
    ),

    QuestionModel(
      id: 'ch5_003',
      type: 'chapter_test',
      materiId: 5,
      question:
          'Pada suhu dan tekanan tertentu, 2 liter gas nitrogen mengandung n molekul. '
          'Pada suhu dan tekanan yang sama, jumlah molekul gas oksigen '
          'yang volumenya 10 liter adalah ....',
      options: {
        'A': 'n molekul gas oksigen',
        'B': '2n molekul gas oksigen',
        'C': '3n molekul gas oksigen',
        'D': '4n molekul gas oksigen',
        'E': '5n molekul gas oksigen',
      },
      correctAnswer: 'E',
      explanation:
          r'$$\frac{V_{O_2}}{V_{N_2}} = \frac{jumlah\ molekul\ O_2}{jumlah\ molekul\ N_2}$$'
          r'$$\frac{10}{2} = \frac{jumlah\ molekul\ O_2}{n}$$'
          r'$$jumlah\ molekul\ O_2 = 5n$$',
    ),

    QuestionModel(
      id: 'ch5_004',
      type: 'chapter_test',
      materiId: 5,
      question:
          'Lima liter gas asetilena dibakar sempurna sesuai reaksi:\n'
          '2C₂H₂(g) + 5O₂(g) → 4CO₂(g) + 2H₂O(g).\n'
          'Pada suhu dan tekanan yang sama, volume O₂, CO₂, dan H₂O '
          'berturut-turut adalah ....',
      options: {
        'A': '10 L ; 8 L ; 5 L',
        'B': '12,5 L ; 10 L ; 5 L',
        'C': '15 L ; 10 L ; 2,5 L',
        'D': '12,5 L ; 8 L ; 2,5 L',
        'E': '10 L ; 12,5 L ; 5 L',
      },
      correctAnswer: 'B',
      explanation:
          r'$$V\ O_2 = \frac{5}{2} \times 5 = 12,5\ L$$'
          r'$$V\ CO_2 = \frac{4}{2} \times 5 = 10\ L$$'
          r'$$V\ H_2O = \frac{2}{2} \times 5 = 5\ L$$',
    ),

    QuestionModel(
      id: 'ch5_005',
      type: 'chapter_test',
      materiId: 5,
      question:
          'Diberikan reaksi:\n'
          'N₂(g) + 3H₂(g) → 2NH₃(g).\n'
          'Jika 4,48 L gas H₂ bereaksi sempurna pada STP, '
          'berapa jumlah molekul NH₃ yang dihasilkan?',
      options: {
        'A': '8,04 × 10²² molekul',
        'B': '3,01 × 10²³ molekul',
        'C': '4,02 × 10²² molekul',
        'D': '1,20 × 10²³ molekul',
        'E': '6,02 × 10²² molekul',
      },
      correctAnswer: 'A',
      explanation:
          r'$$n\ H_2 = \frac{4,48}{22,4} = 0,2\ mol$$'
          r'$$\frac{2}{3} = \frac{n\ NH_3}{0,2} \Rightarrow n\ NH_3 = 0,133\ mol$$'
          r'$$Jumlah\ molekul = 0,133 \times 6,022 \times 10^{23}$$'
          r'$$= 8,04 \times 10^{22}$$',
    ),
  ],
  6: [
    QuestionModel(
      id: 'ch6_001',
      type: 'chapter_test',
      materiId: 6,
      question:
          'Massa glukosa (C₆H₁₂O₆) yang harus dilarutkan dalam 500 mL air '
          'untuk membuat larutan glukosa 0,2 M adalah ....',
      options: {
        'A': '9 gram',
        'B': '54 gram',
        'C': '18 gram',
        'D': '90 gram',
        'E': '36 gram',
      },
      correctAnswer: 'C',
      explanation:
          r'$$Mr\ C_6H_{12}O_6 = (6 \times 12) + (12 \times 1) + (6 \times 16) = 180$$'
          r'$$n = M \times V = 0,2 \times 0,5 = 0,1\ mol$$'
          r'$$m = n \times Mr = 0,1 \times 180 = 18\ g$$',
    ),

    QuestionModel(
      id: 'ch6_002',
      type: 'chapter_test',
      materiId: 6,
      question:
          'Volume larutan H₂SO₄ 0,1 M yang diperlukan untuk mereaksikan '
          '2,7 g logam Al (Ar = 27) adalah ....',
      options: {
        'A': '1 L',
        'B': '1,5 L',
        'C': '4,5 L',
        'D': '5 L',
        'E': '3 L',
      },
      correctAnswer: 'B',
      explanation:
          r'$$2Al + 3H_2SO_4 \rightarrow Al_2(SO_4)_3 + 3H_2$$'
          r'$$n\ Al = \frac{2,7}{27} = 0,1\ mol$$'
          r'$$\frac{3}{2} = \frac{n\ H_2SO_4}{0,1} \Rightarrow n\ H_2SO_4 = 0,15\ mol$$'
          r'$$V = \frac{n}{M} = \frac{0,15}{0,1} = 1,5\ L$$',
    ),

    QuestionModel(
      id: 'ch6_003',
      type: 'chapter_test',
      materiId: 6,
      question:
          'Perhatikan reaksi netralisasi berikut:\n'
          'HCl(aq) + NaOH(aq) → NaCl(aq) + H₂O(l).\n'
          'Jika 25,0 mL larutan HCl 0,10 M dinetralkan sempurna '
          'oleh larutan NaOH 0,20 M, maka volume NaOH yang dibutuhkan adalah ....',
      options: {
        'A': '25,0 mL',
        'B': '12,5 mL',
        'C': '10,0 mL',
        'D': '50,0 mL',
        'E': '6,25 mL',
      },
      correctAnswer: 'B',
      explanation:
          r'$$n\ HCl = M \times V = 0,10 \times 0,025 = 0,0025\ mol$$'
          r'$$n\ NaOH = n\ HCl = 0,0025\ mol$$'
          r'$$V = \frac{n}{M} = \frac{0,0025}{0,20} = 0,0125\ L = 12,5\ mL$$',
    ),

    QuestionModel(
      id: 'ch6_004',
      type: 'chapter_test',
      materiId: 6,
      question:
          'Jika seorang ilmuwan memiliki 100 mL larutan CaCl₂ 0,30 M, '
          'berapa jumlah ion total dalam larutan tersebut?',
      options: {
        'A': '3,01 × 10²² partikel',
        'B': '6,02 × 10²³ partikel',
        'C': '1,81 × 10²² partikel',
        'D': '5,43 × 10²² partikel',
        'E': '9,03 × 10²² partikel',
      },
      correctAnswer: 'D',
      explanation:
          r'$$n\ CaCl_2 = 0,30 \times 0,1 = 0,03\ mol$$'
          r'$$CaCl_2 \rightarrow Ca^{2+} + 2Cl^-$$'
          r'$$n\ ion = 3 \times 0,03 = 0,09\ mol$$'
          r'$$Jumlah\ ion = 0,09 \times 6,022 \times 10^{23}$$'
          r'$$= 5,43 \times 10^{22}$$',
    ),

    QuestionModel(
      id: 'ch6_005',
      type: 'chapter_test',
      materiId: 6,
      question:
          'Berapa massa KOH yang diperlukan untuk membuat 500 mL larutan '
          'KOH 0,50 M? (Mr KOH = 56)',
      options: {
        'A': '5,6 g',
        'B': '11,2 g',
        'C': '14,0 g',
        'D': '28,0 g',
        'E': '7,0 g',
      },
      correctAnswer: 'C',
      explanation:
          r'$$n = M \times V = 0,5 \times 0,5 = 0,25\ mol$$'
          r'$$m = n \times Mr = 0,25 \times 56 = 14\ g$$',
    ),
  ],
  7: [
    QuestionModel(
      id: 'ch7_001',
      type: 'chapter_test',
      materiId: 7,
      question: 'Silahkan lanjut ke menu Mastery Trial untuk mengerjakan posttest lanjutan.',
      options: {
        'A': 'Lanjut ke menu Mastery Trial',
        'B': '-',
        'C': '-',
        'D': '-',
        'E': '-',
      },
      correctAnswer: 'A',
      explanation: 'Lanjut ke menu Mastery Trial',
    ),
  ],
};