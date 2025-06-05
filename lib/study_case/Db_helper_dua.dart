import 'package:andippkd_mpro_b2/study_case/user_model_dua.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperDua {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'siswa.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT,umur INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertSiswa(Siswa siswa) async {
    final db = await DbHelperDua.db();
    await db.insert(
      'siswa',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Siswa>> getAllSiswa() async {
    final db = await DbHelperDua.db();
    final List<Map<String, dynamic>> maps = await db.query('siswa');

    return List.generate(maps.length, (i) => Siswa.fromMap(maps[i]));
  }
}
