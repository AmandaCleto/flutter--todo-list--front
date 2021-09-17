import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/todos.dart';
import 'provider/users.dart';

import 'pages/Home.dart';
import 'pages/Perfil.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodosProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Todo List',
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/perfil': (context) => PerfilPage(),
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
