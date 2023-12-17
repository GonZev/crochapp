import 'package:hive/hive.dart';

part 'pattern_model.g.dart';

@HiveType(typeId: 0)
class PatternModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String content;

  PatternModel(this.id, this.name, this.content);
}
