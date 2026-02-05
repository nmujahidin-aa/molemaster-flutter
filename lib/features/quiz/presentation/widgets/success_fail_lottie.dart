import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/lottie_assets.dart';

class SuccessFailLottieDialog extends StatefulWidget {
  const SuccessFailLottieDialog({super.key, required this.success});
  final bool success;

  @override
  State<SuccessFailLottieDialog> createState() => _SuccessFailLottieDialogState();
}

class _SuccessFailLottieDialogState extends State<SuccessFailLottieDialog> {
  bool _popped = false;

  void _safePop() {
    if (_popped) return;
    _popped = true;
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final asset = widget.success ? LottieAssets.success : LottieAssets.fail;

    return Dialog(
      insetPadding: const EdgeInsets.all(44),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 180,
              height: 180,
              child: Lottie.asset(
                asset,
                repeat: false,
                onLoaded: (composition) {
                  Future.delayed(composition.duration, _safePop);
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.success ? 'Benar!' : 'Belum tepat',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}