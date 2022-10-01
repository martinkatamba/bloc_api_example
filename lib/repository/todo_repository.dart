import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodosRepository {
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((row) {
        return Todo(
            id: row['id'],
            userId: row['userId'],
            title: row['title'],
            completed: row['completed']);
      }).toList();
      return result;
    } else {
      throw "something went wrong ${response.statusCode}";
    }
  }
}
