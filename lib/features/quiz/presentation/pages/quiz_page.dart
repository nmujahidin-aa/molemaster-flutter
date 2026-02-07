import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';
import '../../../../core/utils/snackbars.dart';

import '../bloc/quiz_bloc.dart';
import '../widgets/option_tile.dart';
import '../widgets/success_fail_lottie.dart';

import '../widgets/explanation_view.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.args});
  final QuizArgs args;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(QuizLoadRequested(type: widget.args.type, materiId: widget.args.materiId));
  }

  @override
  void dispose() {
    context.read<QuizBloc>().add(const QuizResetRequested());
    super.dispose();
  }

  Future<void> _handleAnswered(BuildContext context, bool isCorrect, String explanation) async {
    // Lottie dialog (allowed)
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SuccessFailLottieDialog(success: isCorrect),
    );

    if (!isCorrect) {
      // bottom modal explanation
      if (!context.mounted) return;
      await showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pembahasan', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                const SizedBox(height: 10),
                ExplanationView(explanation: explanation),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        automaticallyImplyLeading: !args.isMandatory,
      ),
      body: BlocConsumer<QuizBloc, QuizState>(
        listenWhen: (p, c) => p.status != c.status || (p.isAnswered != c.isAnswered),
        listener: (context, state) async {
          if (state.status == QuizStatus.finished) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.quizResult,
              arguments: QuizResultArgs(
                type: args.type,
                materiId: args.materiId,
                title: args.title,
                correct: state.correctCount,
                total: state.total,
                scorePercent: state.scorePercent,
              ),
            );
          }

          if (state.status == QuizStatus.ready && state.isAnswered) {
            final q = state.currentQuestion!;
            final ok = state.isCorrect ?? false;

            await _handleAnswered(context, ok, q.explanation);

            if (!context.mounted) return;
            context.read<QuizBloc>().add(const QuizNextRequested());
          }
        },
        builder: (context, state) {
          if (state.status == QuizStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == QuizStatus.failure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(state.message ?? 'Gagal memuat soal'),
              ),
            );
          }

          final q = state.currentQuestion;
          if (q == null) return const SizedBox();

          final progressText = 'Soal ${state.index + 1} / ${state.total}';

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(progressText, style: TextStyle(color: Colors.grey.shade700))),
                    Text('Skor: ${state.correctCount}', style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(q.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    children: ['A', 'B', 'C', 'D', 'E'].map((k) {
                      final text = q.options[k] ?? '-';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: OptionTile(
                          label: k,
                          text: text,
                          isSelected: state.selected == k,
                          isCorrectOption: q.correctAnswer == k,
                          showResult: false, // result shown via lottie+modal per requirements
                          onTap: () => context.read<QuizBloc>().add(QuizAnswerSelected(choice: k)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}