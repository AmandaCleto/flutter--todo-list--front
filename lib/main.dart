import 'package:flutter/material.dart';

import 'Todo.dart';
import 'Stats.dart';

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
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> todoList = [
    Todo(
      description: 'Andar de Bike',
      icon: '57585',
      checked: true,
    ),
  ];

  void addNewTodo(String description) {
    final newTodo = Todo(
      description: description,
      icon: '57585',
      checked: false,
    );
    setState(() {
      todoList.add(newTodo);
    });
  }

  int sum = 99;

  // List<Stats> stats = [
  //   Stats(profission: 'Desenvolvedor de Softwares', hobby: 'Ciclista'),
  //   Stats(profission: 'Mestre do bilhar', hobby: 'Incrível'),
  // ];

  final descriptionInput = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    descriptionInput.dispose();
    super.dispose();
  }

  void clearText() {
    descriptionInput.clear();
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
                      fontWeight: FontWeight.w500,
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
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        TextFormField(
                          controller: descriptionInput,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
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
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
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
                                  addNewTodo(
                                    descriptionInput.text,
                                  );
                                  clearText();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xFFECECEC),
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
                            child: Container(
                              color: Color(0xFF34817C),
                              child: ListView.builder(
                                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                                itemCount: todoList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final todo = todoList[index];
                                  return Dismissible(
                                    onDismissed: (DismissDirection direction) {
                                      setState(() {
                                        todoList.removeAt(index);
                                      });
                                    },
                                    secondaryBackground: Container(
                                      child: Align(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              " Deletar",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.centerRight,
                                      ),
                                      color: Color(0xFFC69797),
                                    ),
                                    background: Container(),
                                    key: UniqueKey(),
                                    direction: DismissDirection.endToStart,
                                    child: Center(
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
                                            secondary: Icon(
                                              IconData(
                                                int.parse(todo.icon),
                                                fontFamily: 'MaterialIcons',
                                              ),
                                              color: Color(0xFFEEB868),
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
                                    ),
                                  );
                                },
                              ),
                            ),
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
                height: 330.0,
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
