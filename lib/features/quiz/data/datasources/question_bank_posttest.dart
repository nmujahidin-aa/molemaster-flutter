import '../models/question_model.dart';

const List<QuestionModel> posttestQuestions = [
    QuestionModel(
      id: 'post_001',
      type: 'posttest',
      materiId: 0,
      question: 'Jika 11,2 L gas O₂ diukur pada STP, maka jumlah atom oksigen di dalam gas tersebut adalah...',
      options: {
        'A': '3,01 × 10²³ atom', 
        'B': '6,02 × 10²³ atom', 
        'C': '1,20 × 10²³ atom', 
        'D': '3,01 × 10²⁴ atom', 
        'E': '1,20 × 10²⁴ atom'
        },
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