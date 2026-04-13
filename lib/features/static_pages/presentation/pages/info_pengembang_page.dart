import 'package:flutter/material.dart';
import '../../data/constant/info_pengembang_data.dart';
import '../widgets/developer_card.dart';

class InfoPengembangPage extends StatelessWidget {
  const InfoPengembangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final developers = developerInfo.map((row) => 
       Developer(
        name: row['name']!,
        role: row['role']!,
        institution: row['institution']!,
        photo: row['photo']!,
      )).toList();

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