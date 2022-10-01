import 'package:bloc_api_example/cubit/todo_cubit.dart';
import 'package:bloc_api_example/repository/todo_repository.dart';
import 'package:bloc_api_example/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodosRepository()),
      child: MaterialApp(
        title: 'Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosPage(title: 'Todos'),
      ),
    );
  }
}
