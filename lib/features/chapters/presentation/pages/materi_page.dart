import 'package:flutter/material.dart';
import '../../../../core/config/routes.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key, required this.args});
  final MateriArgs args;

  static const materiTitles = [
    'Pengantar Mol & Satuan',
    'Bilangan Avogadro (6,022×10²³)',
    'Massa Mol & Mr/Ar',
    'Konversi Massa ↔ Mol ↔ Partikel',
    'Volume Gas (STP) & 22,4 L·mol⁻¹',
    'Konsentrasi Larutan (M = mol·L⁻¹)',
    'Rumus Empiris & Rumus Molekul (Pengantar)',
  ];

  static String materiContent(int id) {
    switch (id) {
      case 1:
        return 'Mol adalah satuan jumlah zat. 1 mol merepresentasikan 6,022×10²³ partikel.\n\n'
            'Konsep mol membantu menghubungkan dunia mikroskopik (atom/molekul) dengan makroskopik (gram, liter).';
      case 2:
        return 'Bilangan Avogadro (Nₐ) = 6,022×10²³ partikel per mol.\n\n'
            'Jumlah partikel = n × Nₐ.\nContoh: 0,5 mol NH₃ memiliki 0,5 × 6,022×10²³ molekul.';
      case 3:
        return 'Mr/Ar digunakan untuk menghitung massa molar.\n\n'
            'Massa molar (g·mol⁻¹) = Mr.\nContoh CaCO₃: Ar(Ca)=40, C=12, O=16 → Mr=40+12+3×16=100 g·mol⁻¹.';
      case 4:
        return 'Konversi penting:\n'
            '- n = m / Mr\n'
            '- jumlah partikel = n × Nₐ\n\n'
            'Jika diketahui massa, hitung mol dulu, lalu partikel.';
      case 5:
        return 'Pada STP, 1 mol gas ideal menempati 22,4 L·mol⁻¹.\n\n'
            'V = n × 22,4 L (STP).\nContoh: 2 mol → 44,8 L.';
      case 6:
        return 'Molaritas: M = n / V.\n'
            'Satuan: mol·L⁻¹.\n\n'
            'Contoh: 0,50 mol NH₃ dalam 1,0 L → 0,50 M.';
      case 7:
        return 'Rumus empiris = perbandingan mol paling sederhana.\n'
            'Rumus molekul = kelipatan rumus empiris.\n\n'
            'Langkah umum: ubah massa → mol → bagi dengan mol terkecil → bulatkan.';
      default:
        return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = args.materiId;
    final title = materiTitles[id - 1];

    return Scaffold(
      appBar: AppBar(title: Text('Materi $id')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    Text(
                      materiContent(id),
                      style: TextStyle(color: Colors.grey.shade800, height: 1.45),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}