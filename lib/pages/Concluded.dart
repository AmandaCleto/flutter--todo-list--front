import 'package:flutter/material.dart';
import '../components/Input.dart';
import '../components/List.dart';

class ConcludedPage extends StatefulWidget {
  @override
  _ConcludedPageState createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcludedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InputComponent(),
            ListComponent(),
          ],
        ),
      ),
    );
  }
}
