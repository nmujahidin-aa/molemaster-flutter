import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: index == 0
              ? LoginPage(
                  key: const ValueKey('login'),
                  onGoRegister: () => setState(() => index = 1),
                )
              : RegisterPage(
                  key: const ValueKey('register'),
                  onGoLogin: () => setState(() => index = 0),
                ),
        ),
      ),
    );
  }
}