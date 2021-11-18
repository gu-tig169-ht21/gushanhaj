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
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => ToDoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newToDo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondView(ToDoItem(toDoText: 'Something to do'))));
          if (newToDo != null) {
            // Lägg till ny Task i ToDolistan
            Provider.of<MyState>(context, listen: false).addTask(newToDo);
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 42),
      ),
    );
  }
}
