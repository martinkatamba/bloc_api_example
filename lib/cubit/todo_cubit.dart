import 'package:bloc_api_example/cubit/todo_state.dart';
import 'package:bloc_api_example/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodosRepository _todosRepository;
  TodoCubit(this._todosRepository) : super(InitTodoState());

  Future<void> fetchTodos() async {
    emit(LoadingTodoState());
    try {
      final response = await _todosRepository.getAll();
      emit(ResponseTodoState(response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
