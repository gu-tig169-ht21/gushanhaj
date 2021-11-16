import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainView(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

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
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 42),
      ),
    );
  }

  Widget _list() {
    return ListView(
      children: [
        _item('Write a book'),
        _item('Do homework'),
        _item('Cuddle with my cat'),
        _item('Watch TV'),
        _item('Cook some food'),
      ],
    );
  }

  Widget _item(strText) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank),
      title: Text(strText),
      trailing: Icon(Icons.close),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TIG169 TODO')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20),
            _addTask(),
            Container(height: 20),
            _addText(),
          ],
        ),
      ),
    );
  }

  Widget _addTask() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'What are you going to do?'),
      ),
    );
  }

  Widget _addText() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 180),
          child: Icon(Icons.add),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text('Add'),
        ),
      ],
    );
  }
}
