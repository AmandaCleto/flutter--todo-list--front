import 'package:flutter/material.dart';
import '../components/Input.dart';
import '../components/List.dart';
import '../drawer/Drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
