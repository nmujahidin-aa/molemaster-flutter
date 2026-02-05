import 'package:flutter/material.dart';
import '../../../../core/config/routes.dart';

class MoleChapterPrereqPage extends StatelessWidget {
  const MoleChapterPrereqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prasyarat')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Sebelum mulai Mole Chapter:\n'
                  '1) Siapkan kalkulator.\n'
                  '2) Pahami Ar/Mr dasar.\n'
                  '3) Baca materi dengan teliti.\n\n'
                  'Setelah materi, kamu akan mengerjakan Post Test. '
                  'Nilai minimal kelulusan: 60.',
                  style: TextStyle(color: Colors.grey.shade800, height: 1.4),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.moleChapterMap),
                child: const Text('Lihat Peta Materi'),
              ),
            )
          ],
        ),
      ),
    );
  }
}