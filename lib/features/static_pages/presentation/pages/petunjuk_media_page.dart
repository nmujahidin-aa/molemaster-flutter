import 'package:flutter/material.dart';

class PetunjukMediaPage extends StatelessWidget {
  const PetunjukMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    const text = 'PETUNJUK MEDIA\n\n'
        '1) Mulai dari Pretest (wajib).\n'
        '2) Buka Mole Chapter dan pelajari Materi 1–7.\n'
        '3) Setelah membaca materi, kerjakan Post Test.\n'
        '   - Lulus jika skor ≥ 60.\n'
        '4) Gunakan Training Chamber untuk latihan bebas.\n'
        '5) Coba Adventure untuk pengalaman belajar yang lebih fun.\n';

    return Scaffold(
      appBar: AppBar(title: const Text('Petunjuk Media')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(text, style: const TextStyle(height: 1.45)),
          ),
        ),
      ),
    );
  }
}