import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//casca da aplicação
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Teste', //icone da app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> items = [];
  final List<Todo> todoList = [
    Todo(description: 'Andar de Bike', checked: false),
    Todo(description: 'Codar ThreeJs', checked: false),
    Todo(description: 'Assistir Anime', checked: true),
    Todo(description: 'Ouvir Música', checked: false),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo do Caio!'),
      ),
      body: ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = widget.todoList[index];
          return CheckboxListTile(
            title: Text(
              todo.description,
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                color: Colors.lime[900],
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
            key: Key(todo.description),
            value: todo.checked,
            onChanged: (value) {
              setState(() {
                todo.checked = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String description;
  bool? checked;

  Todo({this.description = '', this.checked = false});
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('41'),
    ],
  ),
);
