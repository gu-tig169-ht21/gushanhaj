import 'package:flutter/material.dart';
import './model.dart';

class AddTask extends StatefulWidget {
  final ToDoItem task;

  const AddTask(this.task, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddTaskState(task);
  }
}

class AddTaskState extends State<AddTask> {
  String toDoText = 'message';
  TextEditingController textEditingController = TextEditingController();

  AddTaskState(ToDoItem task) {
    this.toDoText = task.toDoText;

    textEditingController.addListener(() {
      setState(() {
        toDoText = textEditingController.text;
      });
    });
  }

//Uppbyggnaden av add_task-sidan med appbar, ruta med hint-text som användaren kan fylla i ny task
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('TIG169 TODO')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What are you going to do?'),
            ),
            Container(height: 20),
            addTask(),
          ],
        ),
      ),
    );
  }

//användaren skapar en ny task och byter sida till första sidan med översikt på tasks med hjälp av navigator.pop
  Widget addTask() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.pop(context, ToDoItem(id: '', toDoText: toDoText));
          },
        ),
      ],
    );
  }
}
