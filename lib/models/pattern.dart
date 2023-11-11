import 'package:sqflite/sqlite_api.dart';

class Design {
  final int id;
  final String name;
  final String content;

  Design({required this.id, required this.name, required this.content});

  Design.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        name = item["name"],
        content = item["content"];

  //Convert the data into a map and vice versa to manipulate
  //the data in the SQLite database.
  Map<String, Object> toMap() {
    return {'id': id, 'name': name, 'content': content};
  }
}
