import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todos.dart';
import '../model/Todo.dart';

class InputComponent extends StatefulWidget {
  const InputComponent({Key? key}) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent>
    with SingleTickerProviderStateMixin {
  String title = '';
  final itemInput = TextEditingController();
  final descriptionInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  bool clicked = false;
  bool itemClicked = true;
  double _descriptionTopHeight = 15;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    itemInput.dispose(); // Clean up the controller when the widget is disposed.
    descriptionInput.dispose();
    super.dispose();
  }

  void clearText() {
    itemInput.clear();
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
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    top: _descriptionTopHeight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontFamily: 'RobotoSlab',
                        ),
                        controller: descriptionInput,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide.none,
                          ),

                          helperText: '',
                          isDense: true, // important line
                          filled: true,
                          fillColor: Color(0xFFECECEC),
                          hintText: 'Adicione uma descrição se quiser :)',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'RobotoSlab',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 50),
                    child: TextFormField(
                      controller: itemInput,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'RobotoSlab',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[400],
                        ),
                        // helperText: '',
                        isDense: true, // important line
                        filled: true,
                        fillColor: Color(0xFFECECEC),
                        hintText: 'Adicione um item',
                        hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: 'RobotoSlab',
                          fontSize: 16,
                        ),
                        suffixIcon: Padding(
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
                                  _formKey.currentState!.validate();

                                  if (_errorMessage == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Item adicionado com sucesso :)'),
                                      ),
                                    );
                                    final todo = Todo(
                                      createdTime: DateTime.now(),
                                      title: itemInput.text,
                                      description: descriptionInput.text,
                                      isDone: false,
                                    );
                                    provider.addTodo(todo);
                                    clearText();
                                  } else {
                                    clearText();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Color(0xFFC14343),
                                          content: Text(
                                              'Para adicionar, o campo item não pode estar vazio :)')),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _descriptionTopHeight = itemClicked ? 60 : 10;
                          if (itemClicked == false) {
                            itemClicked = true;
                          }
                        })
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _errorMessage = 'O campo precisa ser preenchido';
                          });
                        } else {
                          setState(() {
                            _errorMessage = '';
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
