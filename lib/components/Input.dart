import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../model/Todo.dart';

class InputComponent extends StatefulWidget {
  const InputComponent({Key? key}) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  String title = '';
  final descriptionInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    descriptionInput
        .dispose(); // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  void clearText() {
    descriptionInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);

    return Container(
      child: Padding(
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
            Form(
              key: _formKey,
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          offset: Offset(1, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: descriptionInput,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                      helperText: '',
                      isDense: true, // important line
                      filled: true,
                      fillColor: Color(0xFFECECEC),
                      hintText: 'Adicione um item',
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
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
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Todo adicionado')),
                                  );
                                  final todo = Todo(
                                    createdTime: DateTime.now(),
                                    title: descriptionInput.text,
                                    isDone: false,
                                  );
                                  provider.addTodo(todo);
                                  clearText();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O campo precisa ser preenchido';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Color(0xFFC5C3C6),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
