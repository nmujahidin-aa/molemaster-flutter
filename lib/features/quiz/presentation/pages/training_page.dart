import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  void initState() {
    super.initState();
    final uid = context.read<AuthBloc>().state.user?.id;
    if (uid != null) {
      context.read<ProgressBloc>().add(ProgressLoadRequested(userId: uid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.read<AuthBloc>().state.user?.id;

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
                  'Latihan bebas untuk memperdalam pemahamanmu.\n'
                  'Kamu bisa mengulang soal kapan saja sesuai kebutuhan belajarmu.',
                  style: TextStyle(color: Colors.grey.shade800, height: 1.4),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // === Bagian Tengah (nilai / lottie) ===
            Expanded(
              child: uid == null
                  ? const SizedBox()
                  : BlocBuilder<ProgressBloc, ProgressState>(
                      builder: (context, state) {
                        final best = state.progress?.trainingBestScore;

                        if (best == null) {
                          // Belum pernah training: tampilkan lottie placeholder
                          return Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Lottie.asset(
                                        'assets/lottie/training_idle.json',
                                        repeat: true,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Belum ada skor latihan',
                                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Ayo mulai latihan untuk melihat skor terbaikmu.',
                                      style: TextStyle(color: Colors.grey.shade700),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }

                        // Sudah pernah training: tampilkan skor terbaik
                        return Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Skor Terbaikmu', style: TextStyle(color: Colors.grey.shade700)),
                                  const SizedBox(height: 8),
                                  Text(
                                    '$best',
                                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Semakin tinggi semakin bagus.\nKamu boleh latihan ulang kapan saja.',
                                    style: TextStyle(color: Colors.grey.shade700, height: 1.35),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Tombol tetap aktif
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