import '../models/question_model.dart';

const List<QuestionModel> pretestQuestions  = [
  QuestionModel(
    id: 'pre_001',
    type: 'pretest',
    materiId: 0,
    question: 'Dua senyawa berbeda terbentuk dari unsur karbon dan oksigen dengan data massa berikut:\n\n'
        '- Senyawa 1: 12 g C + 16 g O₂\n'
        '- Senyawa 2: 12 g C + 32 g O₂\n\n'
        'Kesimpulan yang tepat berdasarkan data tersebut adalah …',
    options: {
      'A': 'Perbandingan massa oksigen tidak teratur',
      'B': 'Senyawa 2 mengandung 2 kali jumlah atom oksigen dibanding senyawa 1',
      'C': 'Karbon dalam kedua senyawa memiliki massa berbeda',
      'D': 'Massa total kedua senyawa sama',
      'E': 'Hukum kekekalan massa tidak berlaku',
    },
    correctAnswer: 'B',
    explanation: 
      'Untuk 12 g C, massa O yang bergabung bisa 16 g atau 32 g.\n'
      '→ 32 g = 2 × 16 g → berarti jumlah atom oksigen pada senyawa 2 dua kali Senyawa 1. Ini adalah contoh Hukum Perbandingan Berganda',
  ),
  QuestionModel(
    id: 'pre_002',
    type: 'pretest',
    materiId: 0,
    question: 'Gas hidrogen (H₂) dan gas oksigen (O₂) masing-masing 1 mol direaksikan untuk membentuk air. Reaksi: H₂(g) + O₂(g) → H₂O(g) Manakah pernyataan yang benar?',
    options: {
      'A': 'Jumlah partikel H₂ dan O₂ berbeda', 
      'B': 'Massa kedua gas sama', 
      'C': 'Jumlah partikel H₂ dan O₂ sama', 
      'D': 'Volume H₂ dua kali volume O₂ pada kondisi sama', 
      'E': 'Setiap 1 mol gas menempati volume yang berbeda pada STP'
    },
    correctAnswer: 'D',
    explanation: 'Volume gas berbanding lurus dengan jumlah mol (Hukum Avogadro). Karena perbandingan H₂ dan O₂ adalah 2:1 maka pada kondisi tersebut volume H₂ dua kali volume O₂',
  ),
  QuestionModel(
    id: 'pre_003',
    type: 'pretest',
    materiId: 0,
    question: 
      'Suatu reaksi:\n'
      'CO(g) + O2(g) → CO2(g) Jika gas CO yang direaksikan bervolume 10 mL, maka volume O2 yang CO2 berturut turut adalah...',
    options: {
      'A': '5 mL dan 10 mL', 
      'B': '10  mL dan 5 mL', 
      'C': '10 mL dan 10 mL', 
      'D': '10 mL dan 15 mL', 
      'E': '5 mL dan 5 mL'
    },
    correctAnswer: 'A',
    explanation: 'Reaksi: \n'
    'CO + ½ O₂ → CO₂ (dikali 2 agar tidak ada koefisien pecahan)\n'
    '2 CO + O₂ → CO₂\n'
    'Perbandingan volume gas sama dengan perbandingan koefisien:\n'
    '2CO : O₂ : 2CO₂ = 2 : 1 : 2\n'
    'Jika CO = 10 mL, maka O₂ = 5 mL dan CO₂ = 10 mL.',
  ),
  QuestionModel(
    id: 'pre_004',
    type: 'pretest',
    materiId: 0,
    question: 'Berdasarkan soal nomor 3, maka perbandingan molekul CO, O₂, dan CO₂ adalah...',
    options: {
      'A': '2 : 1 : 1',
      'B': '1 : 2 : 2',
      'C': '2 : 2 : 3',
      'D': '1 : 2 : 1',
      'E': '2 : 1 : 2',
    },
    correctAnswer: 'E',
    explanation: 'CO : O₂ : CO₂ = 1 : 0,5 : 1 (dikali 2) → 2 : 1 : 2\n'
    'Jadi, perbandingan molekulnya adalah 2 : 1 : 2.',
  ),
  QuestionModel(
    id: 'pre_005',
    type: 'pretest',
    materiId: 0,
    question: 
    '- Senyawa X terdiri atas 12 g karbon dan 32 g oksigen.\n'
    '- Senyawa Y terdiri atas 6 g karbon dan 16 g oksigen.\n'
    'Perbandingan atom C terhadap O dalam X dan Y adalah...',
    options: {
      'A': 'Sama', 
      'B': '1:2', 
      'C': '1:1', 
      'D': '2:1', 
      'E': '3:2'
    },
    correctAnswer: 'A',
    explanation: 
    'Senyawa X: 12 g C (1 mol) + 32 g O (2 mol) → perbandingan atom C:O = 1:2\n'
    'Senyawa Y: 6 g C (0,5 mol) + 16 g O (1 mol) → perbandingan atom C:O = 1:2\n'
    '→ Perbandingan sama',
  ),
  QuestionModel(
    id: 'pre_006',
    type: 'pretest',
    materiId: 0,
    question: 
    'Perhatikan gambar berikut (bayangkan representasi partikel):\n'
    '- Zat A: terdiri dari molekul dua atom sejenis.\n'
    '- Zat B: terdiri dari molekul dua atom berbeda.\n'
    'Jika masing-masing zat mengandung jumlah molekul sama, maka...',
    options: {
      'A': 'Jumlah atom total di A lebih banyak', 
      'B': 'Jumlah atom total di B lebih banyak', 
      'C': 'Jumlah atom total keduanya sama', 
      'D': 'Zat B lebih berat dari A', 
      'E': 'Tidak dapat ditentukan tanpa massa atom'
    },
    correctAnswer: 'C',
    explanation: 
      'Zat A = molekul 2 atom sejenis → total 2 atom per molekul\n'
      'Zat B = molekul 2 atom berbeda → total juga 2 atom per molekul\n'
      'Jika jumlah molekul sama → jumlah atom total sama',
  ),
  QuestionModel(
    id: 'pre_007',
    type: 'pretest',
    materiId: 0,
    question: 'Zat X berbentuk gas dan terdiri atas dua atom sejenis dalam satu molekul, sedangkan zat Y terdiri atas dua atom berbeda. Zat X dan Y dapat dikategorikan sebagai...',
    options: {
      'A': 'X = unsur, Y = senyawa', 
      'B': 'X = senyawa, Y = unsur', 
      'C': 'X = campuran, Y = unsur', 
      'D': 'X = campuran, Y = senyawa', 
      'E': 'X = senyawa, Y = campuran'
    },
    correctAnswer: 'A',
    explanation: 
      'Zat X = dua atom sejenis → unsur (molekul diatomik)\n'
      'Zat Y = dua atom berbeda → senyawa\n'
      'Jadi: X = unsur, Y = senyawa.',
  ),
  QuestionModel(
    id: 'pre_008',
    type: 'pretest',
    materiId: 0,
    question: 'Suatu reaksi menghasilkan 9 g air dari 1 g hidrogen dan 8 g oksigen. Jika 2 g hidrogen bereaksi sempurna, maka massa air yang dihasilkan adalah...',
    options: {
      'A': '9 g',
      'B': '10 g',
      'C': '16 g',
      'D': '18 g',
      'E': '20 g',
    },
    correctAnswer: 'D',
    explanation: 
    '1 g H + 8 g O → menghasilkan 9 g air.\n'
    'Jika H jadi 2 g, perbandingan tetap:\n'
    'H : Hasil = 1 : 9 → 2 g H menghasilkan 18 g air.',
  ),
  QuestionModel(
    id: 'pre_009',
    type: 'pretest',
    materiId: 0,
    question: 'Manakah pernyataan berikut yang benar mengenai perbedaan unsur, senyawa, dan campuran?',
    options: {
      'A': 'Unsur tersusun atas satu jenis atom, senyawa dari dua atau lebih jenis atom, campuran tersusun secara kimia.', 
      'B': 'Unsur tidak dapat diuraikan lagi, senyawa dapat diuraikan secara fisika.', 
      'C': 'Senyawa terbentuk melalui reaksi kimia, campuran tidak.', 
      'D': 'Campuran dan senyawa memiliki perbandingan massa tetap.', 
      'E': 'Unsur, senyawa, dan campuran semuanya memiliki rumus kimia'
    },
    correctAnswer: 'C',
    explanation: 'Senyawa terbentuk lewat reaksi kimia, sedangkan campuran tidak lewat reaksi kimia (hanya dicampur biasa)',
  ),
  QuestionModel(
    id: 'pre_010',
    type: 'pretest',
    materiId: 0,
    question: 'Dalam percobaan reaksi antara 4 g besi (Fe) dan 2,4 g belerang (S), dihasilkan 6,4 g senyawa FeS. Apa kesimpulan yang dapat diambil dari data tersebut?',
    options: {
      'A': 'Reaksi tidak mengikuti hukum kekekalan massa', 
      'B': 'Terjadi penambahan massa selama reaksi', 
      'C': 'Massa zat sebelum dan sesudah reaksi tetap sama', 
      'D': 'Terjadi pengurangan massa selama reaksi', 
      'E': 'Belerang bereaksi lebih banyak dari seharusnya'
    },
    correctAnswer: 'C',
    explanation: 
    'Sebelum reaksi: 4 g Fe + 2,4 g S = 6,4 g\n'
    'Setelah reaksi: FeS = 6,4 g\n'
    'Massa tetap → Hukum Kekekalan Massa berlaku.',
  ),
];