import '../model/Todo.dart';

// ignore: non_constant_identifier_names
final dummy_todos = [
  Todo(
    createdTime: DateTime.now(),
    title: 'Andar de Bike',
    description: 'Ir até a Ufscar',
    isDone: false,
  ),
  Todo(
    createdTime: DateTime.now(),
    title: 'Almoçar',
    description: '12h',
    isDone: true,
  ),
  Todo(
    createdTime: DateTime.now(),
    title: 'Estudar Flutter e Dart',
    description: '',
    isDone: true,
  ),
];
