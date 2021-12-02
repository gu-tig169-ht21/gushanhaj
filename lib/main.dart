import 'package:flutter/material.dart';
import './todo_list_view.dart';
import 'model.dart';
import 'package:provider/provider.dart';

void main() async {
  var state = MyState();
  await state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TodolistView(),
    );
  }
}
