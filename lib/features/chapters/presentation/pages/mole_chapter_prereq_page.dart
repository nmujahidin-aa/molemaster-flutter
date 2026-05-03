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
                  'Sebelum kita memasuki dunia MoleMaster dan menjelajahi konsep mol, ada baiknya kita memeriksa kembali beberapa hal penting yang sudah kamu pelajari sebelumnya. Konsep mol adalah jembatan yang menghubungkan level submikroskopik (partikel-partikel sangat kecil yang tidak kasat mata) dengan level makroskopik (sesuatu yang nyata dan bisa kita ukur di laboratorium seperti massa dan volume), yang kemudian dapat dinyatakan secara level simbolik melalui rumus dan persamaan reaksi kimia.',
                  textAlign: TextAlign.justify,
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