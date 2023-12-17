import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  static final patternBox = Hive.box('patterns');

  //Create or add single data in hive
  static createPattern(Map data) {
    patternBox.add(data);
  }

  //Get all data stored in hive
  static List getAllPatterns() {
    final data = patternBox.keys.map((key) {
      final value = patternBox.get(key);
      return {"id": key, "name": value["name"], "content": value["content"]};
    }).toList();

    return data.reversed.toList();
  }

  // Get data for particular user in hive
  static Map getPattern(int key) {
    return patternBox.get(key);
  }

  // Update data
  static updatePattern(int key, Map data) {
    patternBox.put(key, data);
  }

  // Delete data por particular pattern
  static deletePattern(int key) {
    return patternBox.delete(key);
  }
}
