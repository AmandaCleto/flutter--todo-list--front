import 'package:flutter/material.dart';

import 'Todo.dart';
import 'Stats.dart';
import 'PersonalStats.dart';

void main() {
  runApp(App());
}

//casca da aplicação
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Teste', //icone da app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFDCDCDD),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Todo> todoList = [
    Todo(
      description: 'Andar de Bike',
      icon: '57810',
      complement: 'Ir até a Ufscar',
      checked: false,
    ),
    Todo(
      description: 'Codar ThreeJs',
      icon: '57718',
      checked: false,
    ),
    Todo(
      description: 'Assistir Anime',
      complement: 'Chihayafuru',
      icon: '58267',
      checked: true,
    ),
    Todo(
      description: 'Ouvir Música',
      icon: '58113',
      checked: false,
    ),
    Todo(
      description: 'Lição da Faculdade',
      complement: 'Fazer o layout do App',
      icon: '58713',
      checked: false,
    ),
    Todo(
      description: 'Dirigir',
      icon: '61382',
      checked: false,
    ),
    Todo(
      description: 'Almoçar',
      icon: '57946',
      checked: false,
    ),
    Todo(
      description: 'Arrumar o Github',
      complement: 'Readme e Perfil',
      icon: '57718',
      checked: false,
    ),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sum = 0;

  Stats stats =
      Stats(profission: 'Desenvolvedor de Softwares', hobby: 'Ciclista');

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Color(0xFF34817C),
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/hero.jpeg'),
                          radius: 40.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Caio o Oliveira',
                        style: TextStyle(
                          color: Color(0xFF2E2E2E),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.4,
                          fontFamily: 'RobotoSlab',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Color(0xFF34817C),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'caioliveira@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF34817C),
                              fontSize: 15.0,
                              fontFamily: 'RobotoSlab',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: const Icon(Icons.star),
                            color: Color(0xFF062726),
                            tooltip: 'aumenta o nível',
                            onPressed: () {
                              setState(() {
                                sum += 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Nível de Exibismo : $sum',
                            style: TextStyle(
                                color: Color(0xFF062726),
                                fontSize: 15.0,
                                fontFamily: 'RobotoSlab'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  color: Color(0xFF062726),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    child: Column(
                      children: [
                        PersonalStats(stats: stats),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                            child: Container(
                              color: Color(0xFF34817C),
                              child: ListView.builder(
                                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                                itemCount: widget.todoList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final todo = widget.todoList[index];
                                  return Center(
                                    child: Container(
                                      child: Theme(
                                        child: CheckboxListTile(
                                          title: Text(
                                            todo.description,
                                            style: TextStyle(
                                              color: Color(0xFF2E2E2E),
                                              letterSpacing: 1.0,
                                              fontFamily: 'RobotoSlab',
                                            ),
                                          ),
                                          subtitle: Text(
                                            todo.complement,
                                            style: TextStyle(
                                              color: Color(0xFFDCDCDD),
                                              fontFamily: 'RobotoSlab',
                                            ),
                                          ),
                                          secondary: Icon(
                                            IconData(
                                              int.parse(todo.icon),
                                              fontFamily: 'MaterialIcons',
                                            ),
                                            color: Color(0xFFC5C3C6),
                                            size: 25,
                                          ),
                                          activeColor: Color(0xFFC5C3C6),
                                          checkColor: Color(0xFF2E2E2E),
                                          key: Key(todo.description),
                                          value: todo.checked,
                                          onChanged: (value) {
                                            setState(() {
                                              todo.checked = value;
                                            });
                                          },
                                        ),
                                        data: ThemeData(
                                            // checked color
                                            primarySwatch: Colors.pink,
                                            // border color
                                            unselectedWidgetColor:
                                                Color(0xFFC5C3C6)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
