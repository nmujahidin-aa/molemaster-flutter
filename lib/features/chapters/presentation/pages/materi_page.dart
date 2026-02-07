import 'package:flutter/material.dart';
import '../../../../core/config/routes.dart';
import '../materi_content/materi_data.dart';
import '../materi_content/materi_renderer.dart';
import '../materi_content/content_blocks.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key, required this.args});
  final MateriArgs args;

  static const materiTitles = [
    'Definisi Awal dari “Mol”',
    'Ar dan Mr (Massa Atom dan Massa Molekul Relatif)',
    'Hubungan Mol ↔ Massa Molar',
    'Volume dan Hubungannya dengan Mol',
    'Perbandingan Volume (Reaksi Gas)',
    'Molaritas dan Hubungannya dengan Mol',
    'Jembatan Mol',
  ];

  static List<MateriBlock> materiBlocks(int id) {
    switch (id) {
      case 1:
        return MateriData.materi1();
      case 2:
        return MateriData.materi2();
      case 3:
        return MateriData.materi3();
      case 4:
        return MateriData.materi4();
      case 5:
        return MateriData.materi5();
      case 6:
        return MateriData.materi6();
      case 7:
        return MateriData.materi7();
      default:
        return const [
          HeadingBlock('Materi tidak ditemukan', level: 2),
          ParagraphBlock('Konten materi belum tersedia.'),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = args.materiId;         
    final title = materiTitles[id - 1];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MateriRenderer(
                blocks: materiBlocks(id), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.quiz,
                      arguments: QuizArgs(
                        type: 'chapter_test',
                        materiId: id,
                        title: 'Post Test Materi $id',
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_outlined),
                  label: const Text('Mulai Post Test'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}