import 'package:flutter/material.dart';
import 'package:remind_launcher/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);

    // save to db
    notifyListeners();
  }
}
