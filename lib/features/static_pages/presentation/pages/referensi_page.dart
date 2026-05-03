import 'package:flutter/material.dart';
import '../widgets/citation_item.dart';
import '../../data/constant/referensi_data.dart';
import '../widgets/reference_title_section.dart';


class ReferensiPage extends StatelessWidget {
  const ReferensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final referenceIndonesiaList = referenceIndonesia.map((item) => item['details']!).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Referensi')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Buku Indonesia =====
                  // const ReferenceSectionTitle('Buku Indonesia'),
                  ...referenceIndonesiaList.map((item) => CitationItem(text: item)).toList(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
