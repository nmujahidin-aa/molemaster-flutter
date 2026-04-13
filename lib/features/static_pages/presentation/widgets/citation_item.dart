import 'package:flutter/material.dart';

class CitationItem extends StatelessWidget {
  final String text;


  const CitationItem({required this.text, super.key});

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