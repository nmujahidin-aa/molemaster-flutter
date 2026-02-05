import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../../core/utils/greeting.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/menu_grid.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc b) => b.state.user);
    final name = user?.name ?? 'Siswa';

    final menus = [
      MenuItemUI(
        'Capaian',
        Image.asset('assets/icon/menu/ic_menu_capaian.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.capaian),
      ),
      MenuItemUI(
        'Mole Chapter',
        Image.asset('assets/icon/menu/ic_menu_mole_chapter.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.moleChapterPrereq),
      ),
      MenuItemUI(
        'Mastery Trial',
        Image.asset('assets/icon/menu/ic_menu_mole_mastery_trial.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.masteryTrial),
      ),
      MenuItemUI(
        'Mole Adventure',
        Image.asset('assets/icon/menu/ic_menu_mole_adventure.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.adventure),
      ),
      MenuItemUI(
        'Training Chamber',
        Image.asset('assets/icon/menu/ic_menu_mole_training_chamber.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.training),
      ),
      MenuItemUI(
        'Feedback',
        Image.asset('assets/icon/menu/ic_menu_feedback.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.feedback),
      ),
      MenuItemUI(
        'Info Pengembang',
        Image.asset('assets/icon/menu/ic_menu_pengembang.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.infoPengembang),
      ),
      MenuItemUI(
        'Referensi',
        Image.asset('assets/icon/menu/ic_menu_referensi.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.referensi),
      ),
      MenuItemUI(
        'Petunjuk Media',
        Image.asset('assets/icon/menu/ic_menu_petunjuk.png', width: 100),
        () => Navigator.pushNamed(context, AppRoutes.petunjuk),
      ),
    ];

    final filtered = menus.where((m) => m.title.toLowerCase().contains(query.toLowerCase())).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(greetingByTime(DateTime.now()), style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextField(
            onChanged: (v) => setState(() => query = v),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Cari menu...',
            ),
          ),
          const SizedBox(height: 16),
          MenuGrid(items: filtered),
        ],
      ),
    );
  }
}