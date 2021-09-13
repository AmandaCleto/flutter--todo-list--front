import 'package:flutter/material.dart';
import '../components/List.dart';

class UnconcludedPage extends StatefulWidget {
  const UnconcludedPage({Key? key}) : super(key: key);

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
            ListComponent(),
          ],
        ),
      ),
    );
  }
}
