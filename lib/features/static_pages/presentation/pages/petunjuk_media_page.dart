import 'package:flutter/material.dart';

class PetunjukMediaPage extends StatelessWidget {
  const PetunjukMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Petunjuk Media')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(Icons.science_outlined, color: primary),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cara Menggunakan Mole Master',
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Ikuti langkah berikut agar belajarmu runtut dan semua fitur terbuka.',
                          style: TextStyle(height: 1.35),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),
          _SectionTitle(title: 'Langkah Belajar yang Disarankan', icon: Icons.alt_route, primary: primary),
          const SizedBox(height: 10),

          _StepCard(
            number: 1,
            title: 'Masuk / Daftar',
            desc: 'Buat akun atau masuk menggunakan email dan password kamu.',
            primary: primary,
          ),
          _StepCard(
            number: 2,
            title: 'Kerjakan Pretest',
            desc: 'Pretest hanya untuk mengetahui kemampuan awal. Tenang, setelah selesai kamu bisa lanjut belajar.',
            primary: primary,
          ),
          _StepCard(
            number: 3,
            title: 'Mulai dari Mole Chapter',
            desc: 'Belajar melalui peta materi. Mulai dari Materi 1 lalu lanjut sampai Materi 7 secara berurutan.',
            primary: primary,
          ),
          _StepCard(
            number: 4,
            title: 'Baca Materi lalu Kerjakan Post Test',
            desc: 'Setelah membaca materi, kerjakan Post Test. Nilai minimal lulus adalah 60.',
            primary: primary,
          ),
          _StepCard(
            number: 5,
            title: 'Buka Materi Berikutnya',
            desc: 'Kalau kamu lulus Post Test, materi berikutnya otomatis terbuka. Kalau belum, ulangi tesnya setelah membaca materi lagi.',
            primary: primary,
          ),
          _StepCard(
            number: 6,
            title: 'Selesaikan Semua Materi → Kerjakan Posttest (Final)',
            desc: 'Setelah semua Mole Chapter selesai, kamu bisa mengerjakan Posttest untuk evaluasi akhir.',
            primary: primary,
          ),

          const SizedBox(height: 16),
          _SectionTitle(title: 'Saat Menjawab Soal', icon: Icons.quiz_outlined, primary: primary),
          const SizedBox(height: 10),

          _BulletCard(
            title: 'Yang akan kamu lihat di layar',
            bullets: const [
              'Pilih jawaban A–E.',
              'Kalau benar → muncul animasi “Berhasil”.',
              'Kalau salah → muncul animasi “Coba lagi”, lalu ada pembahasan singkat agar kamu paham.',
              'Di akhir, kamu akan melihat skor dan hasilnya.',
            ],
            primary: primary,
          ),

          const SizedBox(height: 12),
          _BulletCard(
            title: 'Tips agar cepat naik level',
            bullets: const [
              'Kalau nilai Post Test belum 60, jangan buru-buru: baca materi lagi lalu ulangi.',
              'Gunakan Training Chamber untuk latihan tanpa batas.',
              'Coba Adventure kalau kamu ingin latihan dengan nuansa lebih fun.',
            ],
            primary: primary,
          ),

          const SizedBox(height: 16),
          _SectionTitle(title: 'Fungsi Menu di Home', icon: Icons.grid_view_outlined, primary: primary),
          const SizedBox(height: 10),

          _MenuCard(
            primary: primary,
            items: const [
              _MenuItem(title: 'Capaian', desc: 'Target belajar yang akan kamu capai.'),
              _MenuItem(title: 'Mole Chapter', desc: 'Materi utama 1–7 dengan sistem terbuka bertahap.'),
              _MenuItem(title: 'Mole Mastery Trial', desc: 'Pretest dan Posttest (Posttest terbuka setelah semua materi selesai).'),
              _MenuItem(title: 'Mole Adventure', desc: 'Latihan seru bergaya permainan.'),
              _MenuItem(title: 'Mole Training Chamber', desc: 'Bank soal latihan yang bisa diulang kapan saja.'),
              _MenuItem(title: 'Feedback', desc: 'Kirim saran/masukan untuk pengembangan aplikasi.'),
              _MenuItem(title: 'Referensi', desc: 'Bahan bacaan referensi.'),
              _MenuItem(title: 'Petunjuk Media', desc: 'Panduan penggunaan aplikasi.'),
              _MenuItem(title: 'Info Pengembang', desc: 'Informasi singkat pengembang.'),
            ],
          ),

          const SizedBox(height: 18),
          Card(
            color: primary.withOpacity(0.06),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Kalau kamu merasa “langsung diarahkan” ke Pretest setelah login pertama kali, itu normal. '
                'Pretest memang wajib untuk membuka alur belajar dengan urut.',
                style: TextStyle(height: 1.45),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.icon, required this.primary});
  final String title;
  final IconData icon;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
        )
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.number,
    required this.title,
    required this.desc,
    required this.primary,
  });

  final int number;
  final String title;
  final String desc;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(desc, style: TextStyle(color: Colors.grey.shade700, height: 1.35)),
        ),
      ),
    );
  }
}

class _BulletCard extends StatelessWidget {
  const _BulletCard({required this.title, required this.bullets, required this.primary});

  final String title;
  final List<String> bullets;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),
            ...bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_outline, size: 18, color: primary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(b, style: const TextStyle(height: 1.35))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.items, required this.primary});
  final List<_MenuItem> items;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: items
            .map(
              (e) => ListTile(
                leading: Icon(Icons.circle, size: 10, color: primary.withOpacity(0.75)),
                title: Text(e.title, style: const TextStyle(fontWeight: FontWeight.w800)),
                subtitle: Text(e.desc, style: TextStyle(color: Colors.grey.shade700, height: 1.35)),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem({required this.title, required this.desc});
  final String title;
  final String desc;
}