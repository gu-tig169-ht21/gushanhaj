import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDoItem> list;

  const ToDoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _listItem(context, task)).toList());
  }

  Widget _listItem(context, task) {
    var state = Provider.of<MyState>(context, listen: false);
    return CheckboxListTile(
      title: Text(task.toDoText,
          style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null)),
      secondary: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          state.removeTask(task);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: task.isDone,
      onChanged: (value) {
        state.changedTask(task);
      },
    );
  }
}
