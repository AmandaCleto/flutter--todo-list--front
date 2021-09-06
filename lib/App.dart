import 'package:flutter/material.dart';
import 'components/Input.dart';
import 'components/List.dart';
import 'drawer/Drawer.dart';
import 'Todo.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Todo List', //icone da app
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: const Color(0xFFDCDCDD),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> todoList = [
    Todo(
      description: 'Andar de Bike',
      icon: '57585',
      checked: true,
    ),
  ];
  void addNewTodo(String description) {
    final newTodo = Todo(
      description: description,
      icon: '57585',
      checked: false,
    );
    setState(() {
      todoList.add(newTodo);
    });
  }

  int sum = 99;

  final descriptionInput = TextEditingController();

  @override
  void dispose() {
    descriptionInput.dispose();
    super.dispose();
  }

  void clearText() {
    descriptionInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoList',
          style: TextStyle(
            fontFamily: 'RobotoSlab',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF34817C),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InputComponent(),
            ListComponent(),
          ],
        ),
      ),
      drawer: DrawerComponent(),
    );
  }
}
