import 'package:intl/intl.dart';
import 'package:remind_launcher/utils/enums/notice-type.dart';

class Task {
  NoticeType type;
  String title;
  String body;
  bool done;
  DateTime createdAt;

  Task({
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
      'type': types[this.type],
      'title': this.title,
      'body': this.body,
      'done': this.done ? 1 : 0,
      'created_at': DateFormat('y-M-d j:m:s'),
    };

    return task;
  }

  // Task.fromJson(Map<String, >)
}
