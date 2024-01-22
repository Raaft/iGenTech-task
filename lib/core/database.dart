import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final path = join(await getDatabasesPath(), 'auth_database.db');
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(email TEXT PRIMARY KEY, password TEXT)',
      );
    });
  }

  Database get database => _database;
}
