import 'package:andippkd_mpro_b2/tugas_sebelas/user_model_tugas.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperTugas {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'belanjaan.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE belanjaan(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT,kategori TEXT,harga INTEGER,estimasi INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertBelanjaan(Belanjaan belanjaan) async {
    final db = await DbHelperTugas.db();
    await db.insert(
      'belanjaan',
      belanjaan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Belanjaan>> getAllBelanjaan() async {
    final db = await DbHelperTugas.db();
    final List<Map<String, dynamic>> maps = await db.query('belanjaan');

    return List.generate(maps.length, (i) => Belanjaan.fromMap(maps[i]));
  }

  static Future<void> deleteBelanjaan(int id) async {
    final db = await DbHelperTugas.db();
    await db.delete('belanjaan', where: 'id = ?', whereArgs: [id]);

    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT (*) FROM belanjaan'),
    );
    if (count == 0) {
      await db.execute("DELETE FROM sqlite_sequence WHERE name ='belanjaan'");
    }
  }

  static Future<void> updateBelanjaan(Belanjaan belanjaan) async {
    final db = await DbHelperTugas.db();
    await db.update(
      'belanjaan',
      belanjaan.toMap(),
      where: 'id = ?',
      whereArgs: [belanjaan.id],
    );
  }
}
