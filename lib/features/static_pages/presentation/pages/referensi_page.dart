import 'package:flutter/material.dart';


class CitationItem extends StatelessWidget {
  final String text;

  const CitationItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16), // hanging indent
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class ReferenceSectionTitle extends StatelessWidget {
  final String title;

  const ReferenceSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}


class ReferensiPage extends StatelessWidget {
  const ReferensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Referensi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // ===== Buku Indonesia =====
                  ReferenceSectionTitle('Buku Indonesia'),

                  CitationItem(
                    'Harnanto, A. & Ruminten. (2009). Kimia 1 : Untuk SMA/MA Kelas X. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Hermawan, Sutarjawinata, P., & Pratomo, H. (2009). '
                    'Aktif Belajar Kimia : untuk SMA dan MA Kelas X. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Khamdinal, Wahyuningsih, T., & Premono, S. (2009). '
                    'Kimia : SMA/MA Kelas X. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Rahayu, I. (2009). Praktis Belajar Kimia 1 : Untuk Kelas X '
                    'Sekolah Menengah Atas/Madrasah Aliyah. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Setyawati, A. A. (2009). Kimia : Mengkaji Fenomena Alam '
                    'Untuk Kelas X SMA/MA. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Sunarya, Y. & Setiabuadi, A. (2009). Mudah dan Aktif Belajar Kimia 1 : '
                    'Untuk Kelas X Sekolah Menengah Atas/Madrasah Aliyah. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),
                  CitationItem(
                    'Utami, B., Saputro, A. N. C., Mahardiani, L., Yamtinah, S., '
                    '& Mulyani, B. (2009). Kimia 1 : Untuk SMA/MA Kelas X. '
                    'Jakarta : Pusat Perbukuan, Departemen Pendidikan Nasional.',
                  ),

                  // ===== Buku Inggris =====
                  ReferenceSectionTitle('Buku Inggris'),

                  CitationItem(
                    'Bauer, R. C., Birk, J. P., & Marks, P. S. (2019). '
                    'Introduction to Chemistry (5th Edition). '
                    'New York : McGraw-Hill Education.',
                  ),
                  CitationItem(
                    'Chang, R. & Goldsby, K. A. (2016). '
                    'Chemistry (12th Edition). '
                    'New York : McGraw-Hill Education.',
                  ),
                  CitationItem(
                    'McMurry, J. E., Fay, R. C., & Robinson, J. K. (2016). '
                    'Chemistry (7th Edition). '
                    'Upper Saddle River, New Jersey : Pearson Education, Inc.',
                  ),
                  CitationItem(
                    'Overby, J. & Chang, R. (2022). '
                    'Chemistry (14th Edition). '
                    'New York : McGraw-Hill Education.',
                  ),
                  CitationItem(
                    'Oxtoby, D. W., Gillis, H. P., & Butler, L. J. (2016). '
                    'Principles of Modern Chemistry (8th Edition). '
                    'Boston : Cengage Learning.',
                  ),
                  CitationItem(
                    'Whitten, K. W., Davis, R. E., Peck, M. L., & Stanley, G. G. (2010). '
                    'Chemistry (9th Edition). '
                    'Belmont : Brooks/Cole Cengage Learning.',
                  ),
                  CitationItem(
                    'Zumdahl, S. S. & Zumdahl, S. A. (2014). '
                    'Chemistry (9th Edition). '
                    'Belmont : Brooks/Cole Cengage Learning.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
