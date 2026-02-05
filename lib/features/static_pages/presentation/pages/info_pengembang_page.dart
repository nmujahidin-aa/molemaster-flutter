import 'package:flutter/material.dart';


class Developer {
  final String name;
  final String role;
  final String institution;
  final String photo;

  Developer({
    required this.name,
    required this.role,
    required this.institution,
    required this.photo,
  });
}

class DeveloperCard extends StatelessWidget {
  final Developer dev;

  const DeveloperCard({super.key, required this.dev});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: const Color.fromARGB(255, 145, 209, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                dev.photo,
                width: 64,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dev.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dev.role,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dev.institution,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.3,
                    ),
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

class InfoPengembangPage extends StatelessWidget {
  const InfoPengembangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final developers = [
      Developer(
        name: 'Fatimah Az-Zahra',
        role: 'Mahasiswa',
        institution:'S1 Pendidikan Kimia, FMIPA, Universitas Negeri Malang',
        photo: 'assets/images/fatimah.png',
      ),
      Developer(
        name: 'Nur Candra Eka Setiawan, S.Pd., S.Si., M.Pd., Ph.D.',
        role: 'Dosen Pembimbing',
        institution: 'Dosen Departemen Kimia, FMIPA, Universitas Negeri Malang',
        photo: 'assets/images/candra.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Info Pengembang')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: developers.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return DeveloperCard(dev: developers[index]);
          },
        ),
      ),
    );
  }
}