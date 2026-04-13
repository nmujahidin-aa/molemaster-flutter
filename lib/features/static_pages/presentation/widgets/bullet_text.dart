import 'package:flutter/material.dart';

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
            child: Text(text, textAlign: TextAlign.justify, style: const TextStyle(height: 1.4)),
          ),
        ],
      ),
    );
  }
}