import 'package:test_to_do/presentation/model/todo_form_ui_model.dart';

sealed class TodoFormState {}

class TodoFormInitial extends TodoFormState {}

class TodoFormLoading extends TodoFormState {}

class TodoFormSuccess extends TodoFormState {
  final TodoFormUiModel data;
  TodoFormSuccess(this.data);
}

class TodoFormError extends TodoFormState {
  final String message;
  TodoFormError(this.message);
}
