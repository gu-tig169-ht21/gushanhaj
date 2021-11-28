import 'dart:convert';
import 'package:http/http.dart' as http;
import './model.dart';

const API_KEY = 'd05e83f8-4da7-4460-821d-288a75c73b34';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<ToDoItem>> addTask(ToDoItem task) async {
    Map<String, dynamic> json = ToDoItem.toJson(task);
    var bodyString = jsonEncode(json);
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
    var response =
        await http.delete(Uri.parse('$API_URL/todos/$taskId?key=$API_KEY'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }

  static Future changeTask(String taskId, ToDoItem task) async {
    Map<String, dynamic> json = ToDoItem.toJson(task);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$taskId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }

  static Future<List<ToDoItem>> getToDos() async {
    http.Response response =
        await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    var bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<ToDoItem>((data) {
      return ToDoItem.fromJson(data);
    }).toList();
  }
}
