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
      MenuItemUI('Capaian', Icons.flag_outlined, () => Navigator.pushNamed(context, AppRoutes.capaian)),
      MenuItemUI('Mole Chapter', Icons.map_outlined, () {
        Navigator.pushNamed(context, AppRoutes.moleChapterPrereq);
      }),
      MenuItemUI('Mole Mastery Trial', Icons.quiz_outlined, () => Navigator.pushNamed(context, AppRoutes.masteryTrial)),
      MenuItemUI('Mole Adventure', Icons.videogame_asset_outlined, () => Navigator.pushNamed(context, AppRoutes.adventure)),
      MenuItemUI('Mole Training Chamber', Icons.school_outlined, () => Navigator.pushNamed(context, AppRoutes.training)),
      MenuItemUI('Feedback', Icons.feedback_outlined, () => Navigator.pushNamed(context, AppRoutes.feedback)),
      MenuItemUI('Info Pengembang', Icons.person_pin_outlined, () => Navigator.pushNamed(context, AppRoutes.infoPengembang)),
      MenuItemUI('Referensi', Icons.menu_book_outlined, () => Navigator.pushNamed(context, AppRoutes.referensi)),
      MenuItemUI('Petunjuk Media', Icons.help_outline, () => Navigator.pushNamed(context, AppRoutes.petunjuk)),
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