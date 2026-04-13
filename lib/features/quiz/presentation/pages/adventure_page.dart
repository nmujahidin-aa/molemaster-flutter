import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';

class AdventurePage extends StatelessWidget {
  const AdventurePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Adventure uses the same quiz engine but with "adventure" type (materi_id = 0)
    return Scaffold(
      appBar: AppBar(title: const Text('Mole Adventure')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Mode Petualangan: Setiap jawaban yang benar akan memberimu bintang. Kumpulkan bintang sebanyak mungkin dan lanjutkan petualanganmu!',
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
                    arguments: const QuizArgs(type: 'adventure', materiId: 0, title: 'Adventure'),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Mulai Adventure'),
              ),
            )
          ],
        ),
      ),
    );
  }
}