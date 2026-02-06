import 'package:flutter/material.dart';
import 'package:test_to_do/presentation/controller/todo_form_controller.dart';

class TodoFormProvider extends InheritedNotifier<TodoFormController> {
  const TodoFormProvider({
    super.key,
    required TodoFormController super.notifier,
    required super.child,
  });

  static TodoFormController watch(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<TodoFormProvider>();
    assert(provider != null, 'TodoFormProvider not found');
    return provider!.notifier!;
  }

  static TodoFormController read(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<
        TodoFormProvider>();
    final widget = element?.widget as TodoFormProvider?;
    assert(widget != null, 'TodoFormProvider not found');
    return widget!.notifier!;
  }
}
