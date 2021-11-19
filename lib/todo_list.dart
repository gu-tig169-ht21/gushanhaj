import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ToDoList extends StatelessWidget {
  List<ToDoItem> list;

  ToDoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _listItem(context, task)).toList());
  }

  Widget _listItem(context, task) {
    var state = Provider.of<MyState>(context, listen: false);
    return CheckboxListTile(
      title: Text(task.toDoText),
      secondary: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTask(task);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: task.isDone,
      onChanged: (value) {
        state.isDone(task);
      },
    );
  }
}
//  Widget _listItem(context, task) {
//    return ListTile(
//      leading: ToDoCB(), //checkbox-som ligger i model
//      leading: Icon(Icons.check_box_outline_blank),
//      title: Text(task.toDoText),
//      trailing: const Icon(Icons.close),
//      onTap: () {
//        var state = Provider.of<MyState>(context, listen: false);
//        state.removeTask(task);
//      },
//    );
//  }
//}