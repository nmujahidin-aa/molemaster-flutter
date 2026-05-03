import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/core/config/routes.dart';
import 'package:mole_master/features/auth/presentation/bloc/auth_bloc.dart';

/// Base widget untuk halaman yang membutuhkan autentikasi
abstract class AuthenticatedWidget extends StatelessWidget {
  const AuthenticatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthBloc>().state.user?.id;
    
    if (userId == null) {
      return const UnauthorizedScreen();
    }
    
    return buildAuthenticated(context, userId);
  }
  
  Widget buildAuthenticated(BuildContext context, String userId);
}

class UnauthorizedScreen extends StatelessWidget {
  const UnauthorizedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 64),
            const SizedBox(height: 16),
            const Text('Silahkan login terlebih dahulu'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.auth),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}