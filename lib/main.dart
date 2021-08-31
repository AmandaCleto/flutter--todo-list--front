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
        primarySwatch: Colors.indigo,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo do Caio :D'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('hello'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('hello'),
              Text('hello'),
              Text('hello'),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(20.0),
                child: Text('derere'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Todo {
  String description;
  bool? checked;

  Todo({this.description = '', this.checked = false});
}


// ListView.builder(
//         itemCount: widget.todoList.length,
//         itemBuilder: (BuildContext context, int index) {
//           final todo = widget.todoList[index];
//           return CheckboxListTile(
//             title: Text(
//               todo.description,
//               style: TextStyle(
//                 fontFamily: 'RobotoSlab',
//                 color: Colors.lime[900],
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//                 letterSpacing: 1.2,
//               ),
//             ),
//             key: Key(todo.description),
//             value: todo.checked,
//             onChanged: (value) {
//               setState(() {
//                 todo.checked = value;
//               });
//             },
//           );
//         },