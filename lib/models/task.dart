import 'package:intl/intl.dart';
import 'package:remind_launcher/utils/database.dart';
import 'package:remind_launcher/utils/enums/notice-type.dart';
import 'package:sqflite/sqlite_api.dart';

class Task {
  String id;
  NoticeType type;
  String title;
  String body;
  bool done;
  DateTime createdAt;

  Task({
    this.id,
    this.type,
    this.title,
    this.body,
    this.done = false,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<NoticeType, String> types = {
      NoticeType.NOTE: 'note',
      NoticeType.PROJECT: 'project',
      NoticeType.REMINDER: 'reminder'
    };

    Map<String, dynamic> task = {
      'id': this.id,
      'type': types[this.type],
      'title': this.title,
      'body': this.body,
      'done': this.done ? 1 : 0,
      'created_at': DateFormat('y-M-d H:m:s').format(createdAt),
    };

    return task;
  }

  static Future<List<Task>> fetchTasks() async {
    // Get a reference to the database.
    Future database = DB.initialize();
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps =
        await db.query('tasks', orderBy: 'created_at');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      Task task = Task.fromJson(maps[i]);
      return task;
    });
  }

  Future<void> insertToDb() async {
    Future database = DB.initialize();
    final Database db = await database;

    await db.insert(
      'tasks',
      this.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Task.fromJson(Map<String, dynamic> task) {
    Map<String, NoticeType> types = {
      'note': NoticeType.NOTE,
      'project': NoticeType.PROJECT,
      'reminder': NoticeType.REMINDER
    };

    id = task['id'];
    type = types[task['type']];
    body = task['body'];
    title = task['title'];
    done = task['done'] == 1;
    createdAt = DateFormat('y-M-d H:m:s').parse(task['created_at']);
  }
}
