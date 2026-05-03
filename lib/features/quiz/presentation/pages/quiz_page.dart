import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';

import '../bloc/quiz_bloc.dart';
import '../widgets/option_tile.dart';
import '../widgets/explanation_view.dart';

import '../widgets/button_nav.dart';

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
    context.read<QuizBloc>().add(
      QuizLoadRequested(
        type: widget.args.type,
        materiId: widget.args.materiId,
      ),
    );
  }

  void _openGrid(BuildContext context, QuizState state) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(state.total, (i) {
              Color color;

              if (state.flagged.contains(i)) {
                color = Colors.orange; // PRIORITY
              } else if (state.isSubmitted) {
                color = state.results[i] == true
                    ? Colors.green
                    : Colors.red;
              } else if (state.answers.containsKey(i)) {
                color = Colors.green;
              } else {
                color = Colors.grey;
              }

              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.read<QuizBloc>().add(QuizJumpToQuestion(i));
                },
                child: Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('${i + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
        actions: [
          BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.grid_view),
                onPressed: () => _openGrid(context, state),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state.status == QuizStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final q = state.currentQuestion;
          if (q == null) return const SizedBox();

          return Column(
            children: [
              /// HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Soal ${state.index + 1} / ${state.total}',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Spacer(),
                    if (state.isSubmitted)
                      Text(
                        'Skor: ${state.correctCount}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),

              /// QUESTION
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  q.question,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              /// OPTIONS (pakai style lama)
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: ['A', 'B', 'C', 'D', 'E'].map((k) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: OptionTile(
                        label: k,
                        text: q.options[k] ?? '-',
                        isSelected: state.selected == k,
                        isCorrectOption: q.correctAnswer == k,
                        showResult: state.isSubmitted,
                        onTap: state.isSubmitted
                            ? null
                            : () => context
                                .read<QuizBloc>()
                                .add(QuizAnswerSelected(choice: k)),
                      ),
                    );
                  }).toList(),
                ),
              ),

              /// PEMBAHASAN
              if (state.isSubmitted)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpansionTile(
                    title: const Text('Pembahasan'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ExplanationView(
                          explanation: q.explanation,
                        ),
                      )
                    ],
                  ),
                ),

              /// BOTTOM BAR (FIXED & PADAT)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: btnStyle,
                        onPressed: state.index == 0
                            ? null
                            : () => context
                                .read<QuizBloc>()
                                .add(QuizPrevRequested()),
                        child: const Text('Prev'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        style: btnStyle,
                        onPressed: () => context
                            .read<QuizBloc>()
                            .add(QuizToggleFlag()),
                        child: Text(
                          state.flagged.contains(state.index)
                              ? 'Unflag'
                              : 'Ragu',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: btnStyle,
                        onPressed: () {
                          if (state.index == state.total - 1) {
                            context
                                .read<QuizBloc>()
                                .add(QuizSubmitRequested());
                          } else {
                            context
                                .read<QuizBloc>()
                                .add(QuizNextRequested());
                          }
                        },
                        child: Text(
                          state.index == state.total - 1
                              ? 'Selesai'
                              : 'Next',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}