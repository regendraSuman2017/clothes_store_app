import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

   Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

   Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'clothesStoreApp.db');

    return await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade
    );
  }

  // ✅ Corrected method: make it static and pass it as a reference
   Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart_items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productId TEXT,
            name TEXT,
            price TEXT,
            quantity INTEGER,
            imageUrl TEXT
          )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS cart_items;');
    }

    await db.execute('''
      CREATE TABLE cart_items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productId TEXT,
            name TEXT,
            price TEXT,
            quantity INTEGER,
            imageUrl TEXT
          )
    ''');
  }




}
