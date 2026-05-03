import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';

import 'materi_1.dart';
import 'materi_2.dart';
import 'materi_3.dart';
import 'materi_4.dart';
import 'materi_5.dart';
import 'materi_6.dart';
import 'materi_7.dart';

class MateriData {
  static List<MateriBlock> materi1() => MateriBab1.blocks;
  static List<MateriBlock> materi2() => MateriBab2.blocks;
  static List<MateriBlock> materi3() => MateriBab3.blocks;
  static List<MateriBlock> materi4() => MateriBab4.blocks;
  static List<MateriBlock> materi5() => MateriBab5.blocks;
  static List<MateriBlock> materi6() => MateriBab6.blocks;
  static List<MateriBlock> materi7() => MateriBab7.blocks;
}