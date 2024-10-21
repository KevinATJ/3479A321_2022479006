import 'package:flutter_lab1/auditclass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'Auditclass_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Auditclasss(id INTEGER PRIMARY KEY AUTOINCREMENT, actionName TEXT)',
        );
      },
      version: 1,
    );
  }

  // ignore: non_constant_identifier_names
  static Future<void> insertAuditclass(Auditclass Auditclass) async {
    final db = await database();
    await db.insert('Auditclasss',Auditclass.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ignore: non_constant_identifier_names
  static Future<List<Auditclass>> Auditclasss() async {
    final db = await database();
    final List<Map<String, dynamic>> maps = await db.query('Auditclasss');
    return List.generate(maps.length, (i) {
      return Auditclass(
        id: maps[i]['id'],actionName: maps[i]['actionName'],
      );
    });
  }
}

