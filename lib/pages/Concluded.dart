import 'package:flutter/material.dart';
import '../components/List.dart';

class ConcludedPage extends StatefulWidget {
  const ConcludedPage({Key? key}) : super(key: key);

  @override
  _ConcludedPageState createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcludedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Expanded(
        child: ListComponent(isDone: true),
        // ),
      ),
    );
  }
}
