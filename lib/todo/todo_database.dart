import 'package:broadway_example_ui/database/database.dart';
import 'package:broadway_example_ui/todo/todo_model.dart';

class TodoDatabase {
  final db = DBHelper.instance;
  Future<int> insertTodo(TodoModel todo) async {
    final database = await db.database;
    return database.insert("Todo", todo.toJson());
  }

  Future<List<TodoModel>> getTodos() async {
    final database = await db.database;
    List<Map<String, dynamic>> data = await database.query("Todo");
    return data.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    final database = await db.database;
    return database.delete("Todo", where: 'id=?', whereArgs: [id]);
  }

  Future<int> update(TodoModel todo) async {
    final database = await db.database;
    return await database.update(
      "Todo",
      todo.toJson(),
      where: 'id=?',
      whereArgs: [todo.id],
    );
  }
}
