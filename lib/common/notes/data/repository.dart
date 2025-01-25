import 'package:notx/common/notes/data/sqflite_connection.dart';
import 'package:notx/common/notes/data/tables.dart';
import 'package:notx/common/notes/models/notes.dart';

class Repository {
  final SqfliteConnection databaseHelper = SqfliteConnection();

  Future<List<Notes>> getAllNotes() async {
    final db = await databaseHelper.initDatabase();
    final List<Map<String, Object?>> notes =
        await db.query(Tables.noteTableName);
    return notes.map((e) => Notes.fromMap(e)).toList();
  }

  Future<int> addNote(Notes notes) async {
    final db = await databaseHelper.initDatabase();
    return db.insert(Tables.noteTableName, notes.toMap());
  }

  Future<int> updateNote(Notes notes) async {
    final db = await databaseHelper.initDatabase();
    return db.update(Tables.noteTableName, notes.toMap(),
        where: 'id = ?', whereArgs: [notes.id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await databaseHelper.initDatabase();
    return db.delete(Tables.noteTableName, where: 'id = ?', whereArgs: [id]);
  }
}
