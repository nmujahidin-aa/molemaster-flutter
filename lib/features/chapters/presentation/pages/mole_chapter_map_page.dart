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
                      Card(
                        child: ListTile(
                          title: const Text('Petunjuk'),
                          subtitle: const Text('Node biru = bisa dipelajari, abu-abu = terkunci.'),
                          trailing: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
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