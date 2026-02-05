import 'package:flutter/material.dart';

class CapaianPage extends StatelessWidget {
  const CapaianPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Memahami definisi mol dan bilangan Avogadro.',
      'Mampu menghitung massa molar (Mr/Ar) senyawa seperti CaCO₃.',
      'Menguasai konversi massa ↔ mol ↔ partikel.',
      'Menghitung volume gas pada STP (22,4 L·mol⁻¹).',
      'Menghitung molaritas larutan (mol·L⁻¹).',
      'Pengenalan rumus empiris & molekul.',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Capaian')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Setelah menggunakan Mole Master, siswa diharapkan mampu:',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...items.map((t) => Card(
                  child: ListTile(
                    leading: Icon(Icons.check_circle_outline, color: Theme.of(context).colorScheme.primary),
                    title: Text(t),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}