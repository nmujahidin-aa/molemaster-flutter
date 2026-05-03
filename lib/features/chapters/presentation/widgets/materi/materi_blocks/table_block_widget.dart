import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/inline_math/inline_math_text_widget.dart';

class TableBlockWidget extends StatelessWidget {
  const TableBlockWidget({required this.block});

  final TableBlock block;

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(color: Colors.grey.shade300);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Table(
          border: TableBorder(
            horizontalInside: border,
            verticalInside: border,
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {},
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.blue.shade50),
              children: block.headers
                  .map((h) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(h, style: const TextStyle(fontWeight: FontWeight.w800)),
                      ))
                  .toList(),
            ),
            ...block.rows.map((r) {
              return TableRow(
                children: r
                .map((cell) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: InlineMathText(
                        text: cell,
                        style: const TextStyle(height: 1.35, color: Colors.black87),
                      align: TextAlign.start,
                      ),
                    ))
                .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}