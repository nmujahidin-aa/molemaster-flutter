import 'package:flutter/material.dart';
import '../widgets/section_header.dart';
import '../widgets/content_card.dart';
import '../widgets/bullet_text.dart';
import '../widgets/paragraph_text.dart';
import '../widgets/numbered_section.dart';

import '../../data/constant/capaian_data.dart';

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
            const SectionHeader(title: SectionTitles.capaian),
            const ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fase E (Kelas X SMA/MA)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ParagraphText(CapaianPembelajaranData),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Elemen =====
            const SectionHeader(title: SectionTitles.elemen),
            ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elemen 1: Pemahaman Kimia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ElemenCapaianData.pemahamanKimia[0].description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(height: 12),

                      ...ElemenCapaianData.pemahamanKimia[0].breakdown.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e.title} -> ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(e.content,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Elemen 2: Keterampilan Proses',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ...ElemenCapaianData.keterampilanProses.asMap().entries.map((entry) {
                    final index = entry.key;
                    final step = entry.value;

                    return NumberedSection(
                      number: index + 1,
                      title: step.title,
                      bullets: step.bullets,
                    );
                  })
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Kompetensi =====
            // const SectionHeader(title: SectionTitles.kompetensi),
            // ContentCard(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: const [
            //       BulletText('Memahami'),
            //       BulletText('Menjelaskan'),
            //       BulletText('Menghitung'),
            //       BulletText('Menerapkan'),
            //       BulletText('Menentukan rumus'),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 20),

            // ===== Tujuan =====
            const SectionHeader(title: SectionTitles.tujuan),
            ContentCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  ...TujuanPembelajaranData.map((item) => BulletText(item.text)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
