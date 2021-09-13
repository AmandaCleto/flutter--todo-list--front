import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todos.dart';

class ListComponent extends StatelessWidget {
  final bool isDone;
  const ListComponent({Key? key, this.isDone = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todosConcludedList = provider.todosConcluded;
    final todosUnconcludedList = provider.todosUnconcluded;

    return Container(
      color: Color(0xFFECECEC),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
        itemCount:
            isDone ? todosConcludedList.length : todosUnconcludedList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo =
              isDone ? todosConcludedList[index] : todosUnconcludedList[index];

          return Dismissible(
            onDismissed: (DismissDirection direction) {
              provider.removeTodo(todo);
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
                      todo.title,
                      style: TextStyle(
                        color: Color(0xFF2E2E2E),
                        letterSpacing: 1.0,
                        fontFamily: 'RobotoSlab',
                      ),
                    ),
                    secondary: Icon(
                      IconData(
                        int.parse('57585'),
                        fontFamily: 'MaterialIcons',
                      ),
                      color: Color(0xFFEEB868),
                      size: 25,
                    ),
                    activeColor: Color(0xFF34817C),
                    checkColor: Color(0xFFFAFAFA),
                    key: Key(todo.title),
                    value: todo.isDone,
                    onChanged: (value) {
                      provider.toggleTodoStatus(todo);
                    },
                  ),
                  data: ThemeData(
                    primarySwatch: Colors.pink, // checked color
                    unselectedWidgetColor: Color(0xFFC5C3C6), // border color
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
