import 'package:flutter/material.dart';
import './model.dart';

class SecondView extends StatefulWidget {
  final ToDoItem task;

  const SecondView(this.task);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(task);
  }
}

class SecondViewState extends State<SecondView> {
  String? toDoText;
  late TextEditingController textEditingController;

  SecondViewState(ToDoItem task) {
    this.toDoText = task.toDoText;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        toDoText = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TIG169 TODO')),
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

  Widget addTask() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context, ToDoItem(toDoText: toDoText));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add')),
      ],
    );
  }
}
