import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/features/quiz/presentation/widgets/option_tile.dart';
import 'package:mole_master/features/quiz/presentation/widgets/success_fail_lottie.dart';

import '../../../../core/constants/lottie_assets.dart';
import '../../../../core/utils/snackbars.dart';
import '../../../quiz/domain/repositories/quiz_repository.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/config/routes.dart';

import '../../../adventure/presentation/bloc/adventure_bloc.dart';

class AdventurePage extends StatelessWidget {
  const AdventurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdventureBloc(context.read<QuizRepository>())..add(const AdventureStarted()),
      child: const _AdventureView(),
    );
  }
}

class _AdventureView extends StatefulWidget {
  const _AdventureView();

  @override
  State<_AdventureView> createState() => _AdventureViewState();
}

class _AdventureViewState extends State<_AdventureView> with SingleTickerProviderStateMixin {
  late final AnimationController _gainCtrl;
  late final Animation<double> _gainScale;

  @override
  void initState() {
    super.initState();
    _gainCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));
    _gainScale = CurvedAnimation(parent: _gainCtrl, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _gainCtrl.dispose();
    super.dispose();
  }

  Future<void> _playAnswerFeedback(BuildContext context, bool correct, String explanation) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SuccessFailLottieDialog(success: correct), // only allowed lottie
    );

    if (!correct) {
      if (!context.mounted) return;
      await showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pembahasan Singkat', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              const SizedBox(height: 8),
              Text(explanation, style: const TextStyle(height: 1.4)),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.select((AuthBloc b) => b.state.user?.name ?? 'Siswa');

    return Scaffold(
      appBar: AppBar(title: const Text('Mole Adventure')),
      body: BlocConsumer<AdventureBloc, AdventureState>(
        listenWhen: (p, c) => p.isAnswered != c.isAnswered || p.status != c.status,
        listener: (context, state) async {
          if (state.status == AdventureStatus.finished) return;

          if (state.isAnswered) {
            final q = state.currentQuestion!;
            final correct = state.lastCorrect ?? false;

            if (correct) {
              _gainCtrl.forward(from: 0);
            }

            await _playAnswerFeedback(context, correct, q.explanation);

            if (!context.mounted) return;
            context.read<AdventureBloc>().add(const AdventureNextRequested());
          }
        },
        builder: (context, state) {
          if (state.status == AdventureStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == AdventureStatus.finished) {
            return _AdventureResult(
              stars: state.stars,
              streak: state.streak,
              onRestart: () => context.read<AdventureBloc>().add(const AdventureRestartRequested()),
            );
          }

          final q = state.currentQuestion!;
          final progress = '${state.index + 1}/${state.questions.length}';

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF1E88E5), Color(0xFFE3F2FD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _HudBar(
                      userName: userName,
                      hearts: state.hearts,
                      stars: state.stars,
                      progress: progress,
                    ),
                    const SizedBox(height: 12),

                    // Combo animation (fun)
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: state.showCombo
                          ? Container(
                              key: const ValueKey('combo'),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                'COMBO x${state.streak}!',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                              ),
                            )
                          : const SizedBox(height: 34, key: ValueKey('empty')),
                    ),

                    const SizedBox(height: 10),

                    // Question card
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, anim) => SlideTransition(
                          position: Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero).animate(anim),
                          child: FadeTransition(opacity: anim, child: child),
                        ),
                        child: Card(
                          key: ValueKey(q.id),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Misi:', style: TextStyle(fontWeight: FontWeight.w900)),
                                const SizedBox(height: 6),
                                Text(
                                  q.question,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, height: 1.35),
                                ),
                                const SizedBox(height: 12),
                                LinearProgressIndicator(
                                  value: (state.index + 1) / state.questions.length,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                const SizedBox(height: 14),

                                // +Stars pop animation
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ScaleTransition(
                                    scale: _gainScale,
                                    child: state.lastGainedStars > 0
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.amber.shade600,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              '+${state.lastGainedStars} ⭐',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Options
                    Column(
                      children: ['A', 'B', 'C', 'D', 'E'].map((k) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: OptionTile(
                            label: k,
                            text: q.options[k] ?? '-',
                            isSelected: state.selected == k,
                            isCorrectOption: q.correctAnswer == k,
                            showResult: false,
                            onTap: () => context.read<AdventureBloc>().add(AdventureOptionSelected(k)),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HudBar extends StatelessWidget {
  const _HudBar({
    required this.userName,
    required this.hearts,
    required this.stars,
    required this.progress,
  });

  final String userName;
  final int hearts;
  final int stars;
  final String progress;

  @override
  Widget build(BuildContext context) {
    Widget heartIcon(bool filled) => Icon(
          filled ? Icons.favorite : Icons.favorite_border,
          color: filled ? Colors.redAccent : Colors.white.withOpacity(0.7),
          size: 20,
        );

    return Card(
      color: Colors.white.withOpacity(0.14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Hai, $userName',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: List.generate(3, (i) => heartIcon(i < hearts)),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade600,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('⭐ $stars', style: const TextStyle(fontWeight: FontWeight.w900)),
            ),
            const SizedBox(width: 10),
            Text(progress, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}

class _AdventureResult extends StatelessWidget {
  const _AdventureResult({
    required this.stars,
    required this.streak,
    required this.onRestart,
  });

  final int stars;
  final int streak;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final title = stars >= 120 ? 'Luar biasa!' : (stars >= 80 ? 'Mantap!' : 'Ayo coba lagi!');
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('Total Stars: $stars', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                  const SizedBox(height: 6),
                  Text('Streak terakhir: $streak', style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Main Lagi'),
            ),
          )
        ],
      ),
    );
  }
}