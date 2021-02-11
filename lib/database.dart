import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:nextchat/models/user.dart';

class DatabaseHelper {
  static final _databaseName = "NextChat.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user_accounts (
        id TEXT PRIMARY KEY,
        username TEXT UNIQUE NOT NULL,
        profile_image TEXT NOT NULL,
        current_account INT NOT NULL
      )
    ''');
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _databaseName),
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database == null) _database = await _initDatabase();
    return _database;
  }

  Future<UserAccount> getCurrentAccount() async {
    Database db = await instance.database;
    var result = await db
        .query("user_accounts", where: "current_account = ?", whereArgs: [1]);
    if (result.isEmpty) {
      return null;
    } else {
      return UserAccount.fromMap(result.first);
    }
  }

  Future<int> queryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.query('SELECT COUNT(*) FROM $tableName'));
  }
}
