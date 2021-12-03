import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './add_task.dart';
import './todo_list.dart';

class TodolistView extends StatelessWidget {
  const TodolistView({Key? key}) : super(key: key);

//Uppbyggnad av första sidan med lista av todo's och filtrering, denna klass som kallas på vid home i main-filen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIG169 TODO'),
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                if (value != null) {
                  Provider.of<MyState>(context, listen: false)
                      .setFilterBy(value);
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('All'), value: 1),
                    const PopupMenuItem(child: Text('Done'), value: 2),
                    const PopupMenuItem(child: Text('Undone'), value: 3),
                  ]),
        ],
      ),
      //filtrering enligt values i _filterlist
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            ToDoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newToDo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddTask(ToDoItem(id: '', toDoText: 'message'))));
          if (newToDo != null) {
            // Lägg till ny Task i ToDolistan
            Provider.of<MyState>(context, listen: false).addTask(newToDo);
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 42),
      ),
    );
  }

  //value 1 = all tasks
  //value 2 = done tasks
  //value 3 = undone tasks

  List<ToDoItem> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) {
      return list.where((task) => task.isDone == true).toList();
    } else if (value == 3) {
      return list.where((task) => task.isDone == false).toList();
    }
    return list;
  }
}
