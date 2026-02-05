import 'package:flutter/material.dart';
import '../../../../core/config/routes.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training Chamber')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Latihan bebas: kamu bisa mengulang kapan saja.\n'
                  'Ambil soal dari Firestore type="training", materi_id=0.',
                  style: TextStyle(color: Colors.grey.shade800, height: 1.4),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.quiz,
                    arguments: const QuizArgs(type: 'training', materiId: 0, title: 'Training'),
                  );
                },
                icon: const Icon(Icons.fitness_center),
                label: const Text('Mulai Latihan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}