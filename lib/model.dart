import 'package:flutter/material.dart';

class ToDoItem {
  String? toDoText;
  bool isDone;

  ToDoItem({this.toDoText, this.isDone = false});

  void toggleDone(ToDoItem task) {
    isDone = !isDone;
  }
}

class MyState extends ChangeNotifier {
  final List<ToDoItem> _list = [];
  int _filterBy = 3;

  List<ToDoItem> get list => _list;

  int get filterBy => _filterBy;

  void setFilterBy(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void addTask(ToDoItem task) {
    _list.add(task);
    notifyListeners();
  }

  void removeTask(ToDoItem task) {
    _list.remove(task);
    notifyListeners();
  }

  void isDone(ToDoItem task) {
    task.toggleDone(task);
    notifyListeners();
  }
}
