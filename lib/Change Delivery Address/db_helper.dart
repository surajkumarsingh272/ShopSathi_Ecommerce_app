import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "delivery.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE IF NOT EXISTS delivery(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            lastName TEXT,
            city TEXT,
            phone TEXT,
            house TEXT,
            apartment TEXT,
            pinCode TEXT
          )
        """);
      },
    );
  }

  static Future<int> insertData(
      String name,
      String lastName,
      String city,
      String phone,
      String house,
      String apartment,
      String pinCode,
      ) async {
    final db = await database;

    return await db.insert("delivery", {
      "name": name,
      "lastName": lastName,
      "city": city,
      "phone": phone,
      "house": house,
      "apartment": apartment,
      "pinCode": pinCode,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    return await db.query("delivery");
  }

  static Future<int> updateData(
      int id,
      String name,
      String lastName,
      String city,
      String phone,
      String house,
      String apartment,
      String pinCode,
      ) async {
    final db = await database;

    return await db.update(
      "delivery",
      {
        "name": name,
        "lastName": lastName,
        "city": city,
        "phone": phone,
        "house": house,
        "apartment": apartment,
        "pinCode": pinCode,
      },
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<int> deleteData(int id) async {
    final db = await database;
    return await db.delete("delivery", where: "id = ?", whereArgs: [id]);
  }
}
