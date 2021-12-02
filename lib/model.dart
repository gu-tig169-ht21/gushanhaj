import 'package:flutter/material.dart';
import 'api.dart';

class ToDoItem {
  String id;
  String toDoText;
  bool isDone;

  ToDoItem({required this.id, required this.toDoText, this.isDone = false});

  void changedCB(ToDoItem task) {
    isDone = !isDone;
  }

  static Map<String, dynamic> toJson(ToDoItem task) {
    return {
      'id': task.id,
      'title': task.toDoText,
      'done': task.isDone,
    };
  }

  static ToDoItem fromJson(Map<String, dynamic> json) {
    return ToDoItem(
      id: json['id'],
      toDoText: json['title'],
      isDone: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<ToDoItem> _list = [];
  int _filterBy = 0;

  List<ToDoItem> get list => _list;
  int get filterBy => _filterBy;

  Future getList() async {
    List<ToDoItem> list = await Api.getToDos();
    _list = list;
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void addTask(ToDoItem task) async {
    _list = await Api.addTask(task);
    notifyListeners();
  }

  void removeTask(ToDoItem task) async {
    _list = await Api.deleteTask(task.id);
    notifyListeners();
  }

  void changedTask(ToDoItem task) async {
    task.changedCB(task);
    _list = await Api.changeTask(task.id, task);
    notifyListeners();
  }

  void isDone(ToDoItem task) async {
    task.changedCB(task);
    notifyListeners();
  }
}
