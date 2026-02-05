import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/lottie_assets.dart';

class SuccessFailLottieDialog extends StatelessWidget {
  const SuccessFailLottieDialog({super.key, required this.success});
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 180,
              height: 180,
              child: Lottie.asset(success ? LottieAssets.success : LottieAssets.fail, repeat: false),
            ),
            const SizedBox(height: 6),
            Text(success ? 'Benar!' : 'Belum tepat',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}