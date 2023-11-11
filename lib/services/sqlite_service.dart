import 'dart:ffi';

import 'package:crochapp/models/pattern.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE patterns(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      content TEXT)
    )""");
  }

  static Future<Database> db() async {
    return openDatabase(
      'base.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createItem(String name, String content) async {
    final db = await SqliteService.db();
    final data = {'name': name, 'content': content};
    final id = await db.insert('patterns', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllPatterns() async {
    final db = await SqliteService.db();
    return db.query('patterns', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getPattern(int id) async {
    final db = await SqliteService.db();
    return db.query('patterns', where: "id=?", whereArgs: [id], limit: 1);
  }

  static Future<int> updatePattern(int id, String name, String content) async {
    final db = await SqliteService.db();
    final data = {'name': name, 'content': content};
    final result =
        await db.update('patterns', data, where: "id=?", whereArgs: [id]);
    return result;
  }

  static Future<void> deletePattern(int id) async {
    final db = await SqliteService.db();
    try {
      await db.delete("patterns", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
