import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle, required this.lottieAsset});

  final String title;
  final String subtitle;
  final String lottieAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 180, child: Lottie.asset(lottieAsset, repeat: true)),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 6),
        Text(subtitle, style: TextStyle(color: Colors.grey.shade700), textAlign: TextAlign.center),
      ],
    );
  }
}