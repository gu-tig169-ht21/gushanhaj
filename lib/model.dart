import 'package:flutter/material.dart';

class ToDoItem {
  String? toDoText;

  ToDoItem({this.toDoText});
}

class MyState extends ChangeNotifier {
  final List<ToDoItem> _list = [];

  List<ToDoItem> get list => _list;

  void addTask(ToDoItem task) {
    _list.add(task);
    notifyListeners();
  }

  void removeTask(ToDoItem task) {
    _list.remove(task);
    notifyListeners();
  }
}

class TaskCB extends StatefulWidget {
  const TaskCB({Key? key}) : super(key: key);

  @override
  State<TaskCB> createState() => _TaskCBState();
}

class _TaskCBState extends State<TaskCB> {
  bool? _taskBool = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: _taskBool,
        onChanged: (value) {
          setState(() {
            _taskBool = value;
          });
        });
  }
}
