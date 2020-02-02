import 'package:flutter/material.dart';
import 'package:remind_launcher/models/task.dart';
import 'package:uuid/uuid.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];
  bool _fetched = false;

  List<Task> get tasks {
    if (!_fetched) _fetchTasksFromDb();
    return _tasks;
  }

  List<Task> get activeTasks {
    if (!_fetched) _fetchTasksFromDb();

    return _tasks.length > 0
        ? _tasks.where((task) => !task.done).toList()
        : _tasks;
  }

  Future _fetchTasksFromDb() async {
    List<Task> tasks = await Task.fetchTasks();
    _fetched = true;

    _tasks = tasks;

    notifyListeners();
  }

  void addTask(Task task) {
    task.id = Uuid().v1();

    _tasks.add(task);

    task.insertToDb();

    notifyListeners();
  }

  void markTaskDone(Task task) {
    task.done = true;
    task.insertToDb();

    notifyListeners();
  }
}
