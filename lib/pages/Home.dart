import 'package:flutter/material.dart';
import '../components/Input.dart';
import '../components/List.dart';
import '../drawer/Drawer.dart';
import '../Todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String description = '';

  // final List<Todo> todoList = [
  //   Todo(
  //     description: 'Andar de Bikeee',
  //     icon: '57585',
  //     checked: true,
  //   ),
  // ];
  // void addNewTodo(String description) {
  //   final newTodo = Todo(
  //     description: description,
  //     icon: '57585',
  //     checked: false,
  //   );
  //   setState(() {
  //     todoList.add(newTodo);
  //   });
  // }

  // int sum = 99;

  // final descriptionInput = TextEditingController();

  // @override
  // void dispose() {
  //   descriptionInput.dispose();
  //   super.dispose();
  // }

  // void clearText() {
  //   descriptionInput.clear();
  // }

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
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   backgroundColor: const Color(0xFFECECEC),
      //   onPressed: () => {},
      //   child: Icon(
      //     Icons.add,
      //     color: const Color(0xFF34817C),
      //   ),
      // ),
      drawer: DrawerComponent(),
    );
  }
}
