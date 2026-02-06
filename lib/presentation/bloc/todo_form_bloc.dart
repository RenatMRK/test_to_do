import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_form_event.dart';
import 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc() : super(TodoFormInitial()) {
    on<TodoFormSubmit>(_onSubmit);
  }

  Future<void> _onSubmit(
    TodoFormSubmit event,
    Emitter<TodoFormState> emit,
  ) async {
    emit(TodoFormLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      debugPrint('📡 SEND TO BACKEND');
      debugPrint(event.model.toString());

      emit(TodoFormSuccess(event.model));
    } catch (e) {
      emit(TodoFormError('Ошибка отправки'));
    }
  }
}
