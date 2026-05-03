import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/core/config/routes.dart';
import 'package:mole_master/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_bloc.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_event.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_state.dart';
import 'package:mole_master/features/chapters/presentation/widgets/map/map_widgets.dart';
import 'package:mole_master/features/chapters/presentation/widgets/map/hint_alert_card.dart';

class MoleChapterMapPage extends StatelessWidget {
  const MoleChapterMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Asumsikan MateriBloc sudah di-provide di level atas (main.dart atau router)
    final userId = context.read<AuthBloc>().state.user?.id;

    // Load progress jika userId ada
    if (userId != null) {
      context.read<MateriBloc>().add(LoadMateriProgress(userId));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mole Chapter')),
      body: BlocBuilder<MateriBloc, MateriState>(
        builder: (context, state) {
          if (state.status == MateriStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final progress = state.progress;
          if (progress == null) {
            return const Center(child: Text('Gagal memuat progress'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const HintAlertCard(),
                const SizedBox(height: 16),
                MolePathMap(
                  materi: _getMateriMeta(),
                  currentMateri: progress.currentMateri,
                  completed: progress.completedMateri,
                  onStartMateri: (materiId) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.materi,
                      arguments: MateriArgs(materiId: materiId),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<MoleMateriMeta> _getMateriMeta() {
    return const [
      MoleMateriMeta(id: 1, title: 'Definisi Awal dari "Mol" (Membangun Pemahaman)', icon: Icons.swap_horiz),
      MoleMateriMeta(id: 2, title: 'Ar dan Mr (Massa Atom dan Massa Molekul Relatif)', icon: Icons.star_outline),
      MoleMateriMeta(id: 3, title: 'Hubungan Mol ↔ Massa Molar', icon: Icons.calculate_outlined),
      MoleMateriMeta(id: 4, title: 'Volume dan Hubungannya dengan Mol', icon: Icons.compare_arrows),
      MoleMateriMeta(id: 5, title: 'Perbandingan Volume (Reaksi Gas)', icon: Icons.air_outlined),
      MoleMateriMeta(id: 6, title: 'Molaritas dan Hubungannya dengan Mol', icon: Icons.water_drop_outlined),
      MoleMateriMeta(id: 7, title: 'Jembatan Mol (Akhir, Sebagai Peta Besar)', icon: Icons.menu_book_outlined),
    ];
  }
}