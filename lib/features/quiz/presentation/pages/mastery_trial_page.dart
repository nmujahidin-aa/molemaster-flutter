import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';

class MasteryTrialPage extends StatefulWidget {
  const MasteryTrialPage({super.key});

  @override
  State<MasteryTrialPage> createState() => _MasteryTrialPageState();
}

class _MasteryTrialPageState extends State<MasteryTrialPage> {
  @override
  void initState() {
    super.initState();
    final uid = context.read<AuthBloc>().state.user?.id;
    if (uid != null) context.read<ProgressBloc>().add(ProgressLoadRequested(userId: uid));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user;
    final uid = user?.id;

    return Scaffold(
      appBar: AppBar(title: const Text('Mole Mastery Trial')),
      body: uid == null
          ? const Center(child: Text('User tidak ditemukan'))
          : BlocBuilder<ProgressBloc, ProgressState>(
              builder: (context, pState) {
                final progress = pState.progress;
                final allChaptersDone = progress?.allChaptersCompleted ?? false;

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.assignment_outlined),
                          title: const Text('Pretest'),
                          subtitle: Text(user!.pretestDone ? 'Sudah selesai' : 'Wajib untuk pengguna baru'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.pretest);
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: ListTile(
                          leading: Icon(allChaptersDone ? Icons.lock_open : Icons.lock_outline),
                          title: const Text('Posttest'),
                          subtitle: Text(allChaptersDone
                              ? 'Terbuka setelah semua Mole Chapter selesai'
                              : 'Terkunci: selesaikan semua Mole Chapter'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: allChaptersDone
                              ? () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.quiz,
                                    arguments: const QuizArgs(type: 'posttest', materiId: 0, title: 'Posttest'),
                                  );
                                }
                              : null,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Catatan: Selesaikan 7 Mole Chapter untuk membuka Posttest.',
                        style: TextStyle(color: Colors.grey.shade700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}