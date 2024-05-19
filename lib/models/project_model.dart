import 'package:hive/hive.dart';

import 'pattern_model.dart';

part 'project_model.g.dart';

@HiveType(typeId: 1)
class ProjectModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final PatternModel pattern;

  ProjectModel(this.id, this.name, this.pattern);
}
