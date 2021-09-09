import 'package:flutter/cupertino.dart';
import '../model/Todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Andar de Bike',
    ),
  ];

  List<Todo> get todos => _todos.toList();

  // List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  // List<Todo> get todosCompleted =>
  //     _todos.where((todo) => todo.isDone == true).toList();

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

  // void updateTodo(Todo todo, String title, String description) {
  //   todo.title = title;
  //   todo.description = description;

  //   notifyListeners();
  // }
}
