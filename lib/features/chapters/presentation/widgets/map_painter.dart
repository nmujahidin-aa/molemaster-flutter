import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  MapPainter({required this.points});
  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade200
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i] + const Offset(0, 30);
      final p2 = points[i + 1] + const Offset(0, 30);
      final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);

      final path = Path()
        ..moveTo(p1.dx, p1.dy)
        ..quadraticBezierTo(mid.dx, mid.dy, p2.dx, p2.dy);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) => oldDelegate.points != points;
}