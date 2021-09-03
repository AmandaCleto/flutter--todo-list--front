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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Todo List', //icone da app
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: const Color(0xFFDCDCDD),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Todo> todoList = [
    Todo(
      description: 'Andar de Bike',
      icon: '57810',
      complement: 'Ir até a Ufscar',
      checked: true,
    ),
    Todo(
      description: 'Codar ThreeJs',
      icon: '57718',
      checked: false,
    ),
    // Todo(
    //   description: 'Assistir Anime',
    //   complement: 'Chihayafuru',
    //   icon: '58267',
    //   checked: true,
    // ),
    // Todo(
    //   description: 'Ouvir Música',
    //   icon: '58113',
    //   checked: false,
    // ),
    // Todo(
    //   description: 'Lição da Faculdade',
    //   complement: 'Fazer o layout do App',
    //   icon: '58713',
    //   checked: false,
    // ),
    // Todo(
    //   description: 'Dirigir',
    //   icon: '61382',
    //   checked: false,
    // ),
    // Todo(
    //   description: 'Almoçar',
    //   icon: '57946',
    //   checked: false,
    // ),
    // Todo(
    //   description: 'Arrumar o Github',
    //   complement: 'Readme e Perfil',
    //   icon: '57718',
    //   checked: false,
    // ),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputController = TextEditingController();
  int sum = 99;

  List<Stats> stats = [
    Stats(profission: 'Desenvolvedor de Softwares', hobby: 'Ciclista'),
    Stats(profission: 'Mestre do bilhar', hobby: 'Incrível'),
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

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
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crie um novo todo:',
                    style: TextStyle(
                      color: Color(0xFF062726),
                      letterSpacing: 1.0,
                      fontFamily: 'RobotoSlab',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.grey[300],
                    child: TextFormField(
                      controller: inputController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.transparent,
                            child: Ink(
                              decoration: const ShapeDecoration(
                                color: Color(0xFF34817C),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                color: Color(0xFFECECEC),
                                onPressed: () {
                                  List<Todo>.filled(
                                      1,
                                      Todo(
                                          description: 'Andar de Bike',
                                          icon: '57810',
                                          complement: 'Ir até a Ufscar',
                                          checked: false),
                                      growable: true);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return AlertDialog(
                                  //       // Retrieve the text the user has entered by using the
                                  //       // TextEditingController.
                                  //       content: Text(inputController.text),
                                  //     );
                                  //   },
                                  // );
                                },
                              ),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFECECEC),
                        hintText: 'Adicione um item',
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(0),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFECECEC),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 300.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF34817C),
                  ),
                  child: Column(
                    children: [
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
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/hero.png'),
                                    radius: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Caio o Oliveira',
                                  style: TextStyle(
                                    color: Color(0xFFECECEC),
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
                                      color: Color(0xFFEEB868),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'caioliveira@gmail.com',
                                      style: TextStyle(
                                        color: Color(0xFFECECEC),
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
                                      color: Color(0xFFEEB868),
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
                                          color: Color(0xFFECECEC),
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
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
