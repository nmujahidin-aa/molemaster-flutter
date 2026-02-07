import 'package:flutter/material.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'content_blocks.dart';

class MateriRenderer extends StatelessWidget {
  const MateriRenderer({super.key, required this.blocks});

  final List<MateriBlock> blocks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (_, i) => _buildBlock(context, blocks[i]),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: blocks.length,
    );
  }

  Widget _buildBlock(BuildContext context, MateriBlock block) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    switch (block) {
      case HeadingBlock():
        final style = switch (block.level) {
          1 => theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          2 => theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          _ => theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
        };
        return Text(block.text, style: style);

      case ParagraphBlock():
        final textWidget = _InlineMathText(
          text: block.text,
          style: TextStyle(
            height: 1.55,
            fontWeight: block.isBold ? FontWeight.w800 : FontWeight.w400,
            color: Colors.grey.shade900,
          ),
          align: TextAlign.justify,
        );

        final child = block.highlight
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primary.withOpacity(0.20)),
                ),
                child: textWidget,
              )
            : textWidget;

        return Padding(
          padding: EdgeInsets.only(left: block.indent),
          child: child,
        );

      case BulletListBlock():
        return Padding(
          padding: EdgeInsets.only(left: block.indent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: block.items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ', style: TextStyle(height: 1.55)),
                    Expanded(
                      child: _InlineMathText(
                        text: item,
                        style: const TextStyle(height: 1.55, color: Colors.black87),
                        align: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );

      case MathBlock():
        final math = Math.tex(
          block.tex,
          mathStyle: MathStyle.display,
          textStyle: const TextStyle(fontSize: 18),
        );

        if (block.highlight) {
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green.shade700.withOpacity(0.35)),
              ),
              child: math,
            ),
          );
        }
        return Center(child: math);

      case ImageBlock():
        final img = Image.asset(block.assetPath, width: block.width, fit: BoxFit.contain);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (block.border)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange.shade200, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: img,
              )
            else
              img,
            if (block.caption != null) ...[
              const SizedBox(height: 6),
              Text(
                block.caption!,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                textAlign: TextAlign.center,
              )
            ]
          ],
        );

      case TableBlock():
        return _MateriTable(block: block);
    }
  }
}

/// Inline math format: "teks ... $n = m/Mr$ ... teks"
class _InlineMathText extends StatelessWidget {
  const _InlineMathText({
    required this.text,
    required this.style,
    this.align = TextAlign.justify,
  });

  final String text;
  final TextStyle style;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'\$(.+?)\$', dotAll: true);

    int last = 0;
    for (final m in regex.allMatches(text)) {
      if (m.start > last) {
        spans.add(TextSpan(
          text: text.substring(last, m.start),
          style: style,
        ));
      }

      final tex = m.group(1) ?? '';
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Math.tex(
              tex,
              mathStyle: MathStyle.text,
              textStyle: style.copyWith(
                fontSize: (style.fontSize ?? 14) + 1,
              ),
            ),
          ),
        ),
      );

      last = m.end;
    }

    if (last < text.length) {
      spans.add(TextSpan(
        text: text.substring(last),
        style: style,
      ));
    }

    return RichText(
      textAlign: align,
      text: TextSpan(children: spans),
    );
  }
}

class _MateriTable extends StatelessWidget {
  const _MateriTable({required this.block});

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
                      child: _InlineMathText(
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