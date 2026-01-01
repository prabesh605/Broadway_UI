import 'package:broadway_example_ui/provider/task_screen.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> task = [];

  void addTask(TaskModel data) {
    task.add(data);
    notifyListeners();
  }

  void changeTask(int index) {
    task[index].isDone = !task[index].isDone;
    notifyListeners();
  }
}
