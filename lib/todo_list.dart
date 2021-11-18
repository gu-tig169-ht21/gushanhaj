import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDoItem> list;

  const ToDoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _listItem(context, task)).toList());
  }

  Widget _listItem(context, task) {
    return ListTile(
      leading: TaskCB(),
      //const Icon(Icons.check_box_outline_blank),
      title: Text(task.toDoText),
      trailing: const Icon(Icons.close),
      onTap: () {
        var state = Provider.of<MyState>(context, listen: false);
        state.removeTask(task);
      },
    );
  }
}
