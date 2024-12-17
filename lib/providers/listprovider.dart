import 'package:flutter/foundation.dart';
import 'package:test_app/model/task.dart';
import 'dart:math';

class TaskList with ChangeNotifier {
  List<Task> _list = [];

  get tasks => _list;
  Random uid = Random();
  void addTask(String item) {
    var id = uid.nextInt(100);
    _list.add(Task(id, item.toString(), false));
    notifyListeners();
  }

  void removeTask(id) {
    _list.removeWhere((element) => element.id == id);
    // _list.remove(id);
    notifyListeners();
  }

  void colorChange(id) {
    var task = _list.firstWhere((element) => element.id == id);
    task.isComplete = !task.isComplete;
    print(task.isComplete);
    print(task.id);
    notifyListeners();
  }
}
