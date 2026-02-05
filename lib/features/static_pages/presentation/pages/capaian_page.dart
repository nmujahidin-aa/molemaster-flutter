import 'package:flutter/material.dart';

class CapaianPage extends StatelessWidget {
  const CapaianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capaian Pembelajaran')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SectionHeader(title: 'Capaian Pembelajaran'),
            const ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kelas X Semester 2 → Fase E',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pada akhir fase E, peserta didik memiliki kemampuan berbahasa untuk berkomunikasi dan bernalar sesuai dengan tujuan, konteks sosial, akademis, dan dunia kerja.Peserta didik mampu memahami, mengolah, menginterpretasi, dan mengevaluasi informasi dari berbagai tipe teks tentang topik yang beragam.'
                    'Peserta didik mampu menyintesis gagasan dan pendapat dari berbagai sumber. Peserta didik mampu berpartisipasi aktif dalam diskusi dan debat. Peserta didik mampu menulis berbagai teks untuk menyampaikan pendapat dan mempresentasikan serta menanggapi informasi nonfiksi dan fiksi secarakritis dan etis',
                    textAlign: TextAlign.justify,
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Elemen =====
            const SectionHeader(title: 'Elemen Capaian Pembelajaran'),
            const ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elemen → Pemahaman Kimia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Peserta didik mampu untuk menerapkan hukum-hukum dasar kimia.',
                    style: TextStyle(height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Kompetensi =====
            const SectionHeader(title: 'Kompetensi Capaian Pembelajaran'),
            ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BulletText('Memahami'),
                  BulletText('Menjelaskan'),
                  BulletText('Menghitung'),
                  BulletText('Menerapkan'),
                  BulletText('Menentukan rumus'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Tujuan =====
            const SectionHeader(title: 'Tujuan Pembelajaran'),
            ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BulletText(
                    'Memahami dan menjelaskan konsep perhitungan mol, massa, '
                    'molaritas, jumlah partikel, dan volume.',
                  ),
                  BulletText(
                    'Menghitung mol, massa, molaritas, jumlah partikel, dan volume.',
                  ),
                  BulletText(
                    'Menerapkan konversi satuan pada konsep mol untuk menyelesaikan perhitungan kimia.',
                  ),
                  BulletText(
                    'Menentukan Rumus Empiris (RE) dan Rumus Molekul (RM) suatu senyawa.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EEDC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xFFD6A84B),
            child: Icon(Icons.groups, size: 14, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Text(
            title, 
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}


class ContentCard extends StatelessWidget {
  final Widget child;

  const ContentCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', textAlign: TextAlign.justify, style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(text, style: const TextStyle(height: 1.4)),
          ),
        ],
      ),
    );
  }
}
