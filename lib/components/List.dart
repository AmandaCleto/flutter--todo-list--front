import 'package:flutter/material.dart';
import '../Todo.dart';

class ListComponent extends StatefulWidget {
  const ListComponent({Key? key}) : super(key: key);

  @override
  _ListComponentState createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  final List<Todo> todoList = [
    Todo(
      description: 'Andar de Bike',
      icon: '57585',
      checked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
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
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                unselectedWidgetColor: Color(0xFFC5C3C6)),
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
    );
  }
}
