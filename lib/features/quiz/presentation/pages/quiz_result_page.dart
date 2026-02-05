import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/config/routes.dart';
import '../../../../core/constants/lottie_assets.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';
import '../../../../core/utils/snackbars.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key, required this.args});
  final QuizResultArgs args;

  Future<void> _showUnlock(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 200, height: 200, child: Lottie.asset(LottieAssets.unlock, repeat: false)),
              const Text('Materi berikutnya terbuka!', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final passed = args.scorePercent >= 60;

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(args.title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    Text('Benar: ${args.correct} / ${args.total}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text('Skor: ${args.scorePercent}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 8),
                    Text(
                      passed ? 'Lulus (≥ 60)' : 'Belum lulus (< 60)',
                      style: TextStyle(
                        color: passed ? Colors.green.shade700 : Colors.red.shade700,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  final uid = context.read<AuthBloc>().state.user?.id;
                  if (uid == null) {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.auth, (r) => false);
                    return;
                  }

                  // Pretest completion => set pretest_done true
                  if (args.type == 'pretest') {
                    await context.read<AuthRepository>().setPretestDone(uid, true);
                    context.read<AuthBloc>().add(const AuthProfileRefreshRequested());
                    AppSnack.success(context, 'Pretest selesai. Selamat belajar!');
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (r) => false);
                    return;
                  }

                  // Chapter test unlock logic
                  if (args.type == 'chapter_test') {
                    if (passed) {
                      // mark materi completed and unlock next
                      context.read<ProgressBloc>().add(ProgressMarkCompletedRequested(userId: uid, materiId: args.materiId));
                      await _showUnlock(context);
                      if (!context.mounted) return;
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.moleChapterMap, (r) => false);
                    } else {
                      // repeat test
                      AppSnack.error(context, 'Nilai < 60. Silakan ulangi Post Test.');
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.quiz,
                        arguments: QuizArgs(
                          type: 'chapter_test',
                          materiId: args.materiId,
                          title: args.title,
                        ),
                      );
                    }
                    return;
                  }

                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (r) => false);
                },
                child: Text(args.type == 'chapter_test' && !passed ? 'Ulangi' : 'Selesai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}