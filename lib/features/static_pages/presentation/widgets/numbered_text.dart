
import 'package:flutter/material.dart';

class NumberedText extends StatelessWidget {
  final String text;
  final int number;

  const NumberedText(this.number, this.text,  {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(    
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$number. ', textAlign: TextAlign.justify, style: const TextStyle(fontSize: 13)),
          Expanded(
            child: Text(text, textAlign: TextAlign.justify, style: const TextStyle(height: 1.4)),
          ),
        ],
      ),
    );
  }
}