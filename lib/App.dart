import 'package:flutter/material.dart';
import 'package:learning_flutter_and_dart/pages/Concluded.dart';
import 'package:provider/provider.dart';
import '../provider/todos.dart';

import 'pages/Home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Todo List',
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/concluded': (context) => ConcludedPage(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: const Color(0xFFDCDCDD),
          ),
        ),
      ),
    ));
  }
}
