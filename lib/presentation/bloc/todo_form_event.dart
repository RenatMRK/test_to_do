import 'package:test_to_do/presentation/model/todo_form_ui_model.dart';

sealed class TodoFormEvent {}

class TodoFormSubmit extends TodoFormEvent {
  final TodoFormUiModel model;
  TodoFormSubmit(this.model);
}
