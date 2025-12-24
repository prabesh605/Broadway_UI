import 'package:broadway_example_ui/database/database.dart';
import 'package:broadway_example_ui/note/note_model.dart';

class NoteDatabase {
  final db = DBHelper.instance;

  Future<int> insert(NoteModel note) async {
    final database = await db.database;
    return database.insert(NoteModel.tableName, note.toJson());
  }

  Future<List<NoteModel>> getData() async {
    final database = await db.database;
    List<Map<String, dynamic>> data = await database.query(NoteModel.tableName);
    return data.map((e) => NoteModel.fromJson(e)).toList();
  }
}
