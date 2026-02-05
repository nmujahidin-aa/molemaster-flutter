import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'home_tab.dart';
import 'profile_tab.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;
  bool _pretestGateShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_pretestGateShown) return;

    final authState = context.read<AuthBloc>().state;
    final user = authState.user;

    if (user != null && user.pretestDone == false) {
      _pretestGateShown = true;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: const Text('Pretest wajib'),
            content: const Text('Selesaikan Pretest terlebih dahulu untuk membuka seluruh fitur.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Lanjut'),
              )
            ],
          ),
        );

        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.pretest, (r) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = const [HomeTab(), ProfileTab()];
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}