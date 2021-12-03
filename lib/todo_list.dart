import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDoItem> list;

  const ToDoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list
            .map((task) => _listItem(context, task))
            .toList()); //listar upp alla tasks/todos i en listview
  }

//Uppbyggnad av listan som returnas/visas i listview
  Widget _listItem(context, task) {
    var state = Provider.of<MyState>(context, listen: false);
    return CheckboxListTile(
      title: Text(task.toDoText,
          style: TextStyle(
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : null)), //Om task/todo är done så stryks texten över
      secondary: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          state.removeTask(task); //Tar bort task vid klick på kryss
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: task.isDone,
      onChanged: (value) {
        state.changedTask(
            task); //uppdatera task till done/undone vid klick i checkbox
      },
    );
  }
}
