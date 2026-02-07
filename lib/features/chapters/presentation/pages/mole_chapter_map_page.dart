import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../progress/presentation/bloc/progress_bloc.dart';
import '../widgets/mole_path_map.dart';

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
            borderRadius: BorderRadius.circular(10),
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
                final materiMeta = const [
                  MoleMateriMeta(id: 1, title: 'Definisi Awal dari “Mol” (Membangun Pemahaman)', icon: Icons.swap_horiz),
                  MoleMateriMeta(id: 2, title: 'Ar dan Mr (Massa Atom dan Massa Molekul Relatif)', icon: Icons.star_outline),
                  MoleMateriMeta(id: 3, title: 'Hubungan Mol ↔ Massa Molar', icon: Icons.calculate_outlined),
                  MoleMateriMeta(id: 4, title: 'Volume dan Hubungannya dengan Mol', icon: Icons.compare_arrows),
                  MoleMateriMeta(id: 5, title: 'Perbandingan Volume (Reaksi Gas)', icon: Icons.air_outlined),
                  MoleMateriMeta(id: 6, title: 'Molaritas dan Hubungannya dengan Mol', icon: Icons.water_drop_outlined),
                  MoleMateriMeta(id: 7, title: 'Jembatan Mol (Akhir, Sebagai Peta Besar)', icon: Icons.menu_book_outlined),
                ];

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const HintAlertCard(),
                      const SizedBox(height: 16),
                      MolePathMap(
                        materi: materiMeta,
                        currentMateri: currentMateri,
                        completed: completed,
                        onStartMateri: (materiId) {
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