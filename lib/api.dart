import 'dart:convert';
import 'package:http/http.dart' as http;
import './model.dart';

const API_KEY = 'f19879c9-b7f1-428a-9d62-acf9f883c92a';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<ToDoItem>> addTask(ToDoItem task) async {
    var bodyString = jsonEncode({
      'title': task.toDoText,
    });
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }

  static Future deleteTask(String taskId) async {
    var response = await http
        .delete(Uri.parse('$API_URL/todos/$taskId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }

  static Future changeTask(String taskId) async {
    var response = await http
        .put(Uri.parse('$API_URL/todos/$taskId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }

  static Future<List<ToDoItem>> getToDos() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }
}
