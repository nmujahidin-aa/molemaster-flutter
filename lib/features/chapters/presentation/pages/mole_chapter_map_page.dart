import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';
import '../widgets/duolingo_map.dart';

class MoleChapterMapPage extends StatefulWidget {
  const MoleChapterMapPage({super.key});

  @override
  State<MoleChapterMapPage> createState() => _MoleChapterMapPageState();
}

class HintAlertCard extends StatelessWidget {
  const HintAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primary.withOpacity(0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_rounded, color: primary),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Node biru = bisa dipelajari\nNode abu-abu = terkunci',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -8,
          left: 24,
          child: Transform.rotate(
            angle: 3.14 / 4,
            child: Container(
              width: 16,
              height: 16,
              color: primary.withOpacity(0.08),
            ),
          ),
        ),
      ],
    );
  }
}


class _MoleChapterMapPageState extends State<MoleChapterMapPage> {
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
      appBar: AppBar(title: const Text('Mole Chapter')),
      body: uid == null
          ? const Center(child: Text('User tidak ditemukan'))
          : BlocBuilder<ProgressBloc, ProgressState>(
              builder: (context, state) {
                if (state.status == ProgressStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final progress = state.progress;
                if (progress == null) {
                  return const Center(child: Text('Gagal memuat progress'));
                }

                final completed = progress.completedMateri.toSet();
                final currentMateri = progress.currentMateri;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const HintAlertCard(),
                      const SizedBox(height: 16),
                      DuolingoMap(
                        total: 7,
                        currentMateri: currentMateri,
                        completed: completed,
                        onTapMateri: (materiId) {
                          final unlocked = materiId <= currentMateri || completed.contains(materiId);
                          if (!unlocked) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Materi terkunci. Selesaikan materi sebelumnya.')),
                            );
                            return;
                          }
                          Navigator.pushNamed(
                            context,
                            AppRoutes.materi,
                            arguments: MateriArgs(materiId: materiId),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
    );
  }
}