import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './add_task.dart';
import './todo_list.dart';

class TodolistView extends StatelessWidget {
  const TodolistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIG169 TODO'),
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('All'), value: 1),
                    const PopupMenuItem(child: Text('Done'), value: 2),
                    const PopupMenuItem(child: Text('Undone'), value: 3),
                  ]),
        ],
      ),
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
                      SecondView(ToDoItem(toDoText: 'title'))));
          if (newToDo != null) {
            // Lägg till ny Task i ToDolistan
            Provider.of<MyState>(context, listen: false).addTask(newToDo);
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 42),
      ),
    );
  }

  List<ToDoItem> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) return list.where((task) => task.isDone == true).toList();
    if (value == 3) return list.where((task) => task.isDone == false).toList();
    return list;
  }
}
