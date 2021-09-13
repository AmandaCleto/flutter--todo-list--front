import 'package:flutter/material.dart';
import '../components/Input.dart';
import '../components/List.dart';

class UnconcludedPage extends StatefulWidget {
  @override
  _UnconcludedPageState createState() => _UnconcludedPageState();
}

class _UnconcludedPageState extends State<UnconcludedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InputComponent(),
            ListComponent(isDone: false),
          ],
        ),
      ),
    );
  }
}
