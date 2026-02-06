import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_to_do/presentation/model/todo_form_ui_model.dart';

class TodoListCubit extends Cubit<List<TodoFormUiModel>> {
  TodoListCubit() : super([]);

  void addTodo(TodoFormUiModel model) {
    emit([...state, model]);
  }
}
