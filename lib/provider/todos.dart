import 'package:flutter/cupertino.dart';
import '../model/Todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Andar de Bike até a Ufscar',
      isDone: false,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Almoçar',
      isDone: false,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Comprar óculos',
      isDone: true,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Terminar SNK',
      isDone: true,
    ),
  ];

  List<Todo> get todos => _todos.toList();

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

  // void updateUserData(Todo todo, String title, String description) {
  //   todo.title = title;
  //   todo.description = description;

  //   notifyListeners();
  // }
}
