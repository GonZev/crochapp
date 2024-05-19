import 'package:hive_flutter/hive_flutter.dart';

class ProjectHiveFunctions {
  static final projectBox = Hive.box('projects');

  //Create or add single data in hive
  static createProject(Map data) {
    projectBox.add(data);
  }

  //Get all data stored in hive
  static List getAllProjects() {
    final data = projectBox.keys.map((key) {
      final value = projectBox.get(key);
      return {"id": key, "name": value["name"], "pattern": value["pattern"]};
    }).toList();

    return data.reversed.toList();
  }

  // Get data for particular user in hive
  static Map getProject(int key) {
    return projectBox.get(key);
  }

  // Update data
  static updateProject(int key, Map data) {
    projectBox.put(key, data);
  }

  // Delete data por particular pattern
  static deleteProject(int key) {
    return projectBox.delete(key);
  }
}
