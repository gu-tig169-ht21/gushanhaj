import 'package:flutter/material.dart';
import 'api.dart';

class ToDoItem {
  String? id;
  String? toDoText;
  bool isDone;

  ToDoItem({this.id, this.toDoText, this.isDone = false});

  void toggleDone(ToDoItem task) {
    isDone = !isDone;
  }

  static Map<String, dynamic> toJson(ToDoItem task) {
    return {
      'title': task.toDoText,
      'id': task.id,
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
  int _filterBy = 1;

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
    _list = await Api.deleteTask(task.id.toString());
    notifyListeners();
  }

  void isDone(ToDoItem task) async {
    _list = await Api.changeTask(task.id.toString());
//    task.toggleDone(task);
    notifyListeners();
  }
}
