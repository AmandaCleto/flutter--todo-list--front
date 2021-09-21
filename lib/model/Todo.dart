class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String icon;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    required this.description,
    this.icon = '',
    this.isDone = false,
  });
}
