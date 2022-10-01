import 'package:bloc_api_example/cubit/todo_cubit.dart';
import 'package:bloc_api_example/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatefulWidget {
  final String title;
  const TodosPage({Key? key, required this.title}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is InitTodoState || state is LoadingTodoState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResponseTodoState) {
          final todos = state.todos;
          return Center(
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.title),
                  );
                }),
          );
        } else if (state is ErrorTodoState) {
          return Center(
            child: Text(state.message),
          );
        }

        return Center(
          child: Text(state.toString()),
        );
      }),
    );
  }
}
