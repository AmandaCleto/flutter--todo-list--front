import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../model/Todo.dart';

import '../data/dummy_todos.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = dummy_todos;

  final id = Random().nextDouble().toString();

  List<Todo> get todosConcluded =>
      _todos.where((todo) => todo.isDone == true).toList();

  List<Todo> get todosUnconcluded =>
      _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
