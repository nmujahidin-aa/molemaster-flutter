import 'package:flutter/material.dart';

class ReferensiPage extends StatelessWidget {
  const ReferensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    const text = 'REFERENSI\n\n'
        '1) Buku Kimia SMA/MA Kelas X/XI (Kurikulum yang berlaku)\n'
        '2) Materi konsep mol: bilangan Avogadro, massa molar, STP, molaritas\n'
        '3) Sumber latihan soal internal aplikasi\n\n'
        'Catatan: Konten ini bersifat dummy dan dapat disesuaikan dengan referensi resmi sekolah.';

    return Scaffold(
      appBar: AppBar(title: const Text('Referensi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(text, style: const TextStyle(height: 1.45)),
            ),
          ),
        ),
      ),
    );
  }
}