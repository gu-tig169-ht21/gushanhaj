import 'package:flutter/cupertino.dart';
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

  get colors => null;

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
      trailing: Icon(Icons.highlight_remove),
    );
  }
}

Widget _checkboxRow() {
  return Container(
    margin: EdgeInsets.only(top: 25, bottom: 50),
    child: Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        const Text('Write a book'),
        Container(width: 250),
        const Icon(Icons.close),
      ],
    ),
  );
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}


//Har haft problem med flutter hela dagen och har inte hunnit göra klart allt än