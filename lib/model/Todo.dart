class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String icon;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.icon = '',
    this.isDone = false,
  });
}
