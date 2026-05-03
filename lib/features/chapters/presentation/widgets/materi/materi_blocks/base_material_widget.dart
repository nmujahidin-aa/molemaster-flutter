import 'package:flutter/material.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

abstract class BaseMateriWidget<T extends MateriBlock> extends StatelessWidget {
  final T block;
  
  const BaseMateriWidget({super.key, required this.block});
}