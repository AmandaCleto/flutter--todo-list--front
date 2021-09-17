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
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFFC5C3C6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.zero,
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(0),
                      ),
                      child: ListComponent(isDone: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
