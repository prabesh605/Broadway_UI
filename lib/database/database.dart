import 'package:broadway_example_ui/todo/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();
  static Database? _database;
  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'myDatabase.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT, body TEXT)',
    );
  }

  Future<int> insertTodo(TodoModel todo) async {
    final db = await instance.database;
    return db.insert("Todo", todo.toJson());
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await instance.database;
    List<Map<String, dynamic>> data = await db.query("Todo");
    return data.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete("Todo", where: 'id=?', whereArgs: [id]);
  }
}
