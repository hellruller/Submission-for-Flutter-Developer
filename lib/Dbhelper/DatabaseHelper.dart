import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stargroup/Modelclasses/PostModel.dart';

class DatabaseHelper {
  static final _databaseName = 'posts.db';
  static final _databaseVersion = 1;

  static final table = 'posts';

  static final columnId = 'id';
  static final columnUserId = 'userId';
  static final columnTitle = 'title';
  static final columnBody = 'body';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnUserId INTEGER,
        $columnTitle TEXT,
        $columnBody TEXT
      )
    ''');
  }

  Future<bool> isRecordExists(int id) async {
    final db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM $table WHERE $columnId = ?',
      [id],
    ));
    return count! > 0;
  }

  Future<int> insert(postemodel post) async {
    final db = await database;
    return await db.insert(table, post.toMap());
  }

  Future<List<postemodel>> getAllPosts() async {
    final db = await database;
    final result = await db.query(table);
    return result.map((json) => postemodel.fromMap(json)).toList();
  }
}