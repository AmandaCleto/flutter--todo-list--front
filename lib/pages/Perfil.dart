import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Persona.dart';
import '../provider/person.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

//reencrevendo a classe TextEditingController para o cursor ficar sempre no final
class TextController extends TextEditingController {
  TextController({String text: ''}) {
    this.text = text;
  }

  set text(String newText) {
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty);
  }
}

class _PerfilPageState extends State<PerfilPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    final personData = provider.personData;
    final emailInput = TextController(text: personData.email);
    final nameInput = TextController(text: personData.name);

    return Scaffold(
      backgroundColor: Color(0xFF2E2E2E),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFFAFAFA),
        ),
        title: Text(
          'Perfil',
          style: TextStyle(
            fontFamily: 'Arial',
            color: Color(0xFFFAFAFA),
          ),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xFF2E2E2E),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: new BoxDecoration(
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      color: Color(0xFF34817C),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/hero.png'),
                            radius: 70.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        TextSelection previousSelection = nameInput.selection;
                        nameInput.text = text;
                        nameInput.selection = previousSelection;
                      },
                      controller: nameInput,
                      cursorColor: Color(0xFF34817C),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFDCDCDD),
                      ),
                      decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: 0,
                          top: 8,
                          right: 15,
                          bottom: 0,
                        ),
                        errorStyle: TextStyle(
                          fontFamily: 'RobotoSlab',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC69797),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF34817C),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFAFAFA),
                          ),
                        ),
                        hintText: 'Preencha seu e-mail',
                        hintStyle: TextStyle(
                          color: Color(0xFF34817C),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'O campo não pode estar vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onChanged: (text) {},
                      controller: emailInput,
                      cursorColor: Color(0xFF34817C),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFDCDCDD),
                      ),
                      decoration: const InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: 0,
                          top: 8,
                          right: 15,
                          bottom: 0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF34817C),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFAFAFA),
                          ),
                        ),
                        hintText: 'Preencha seu e-mail',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'O campo não pode estar vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return states.contains(MaterialState.pressed)
                                ? Color(0xFF586F7C)
                                : null;
                          },
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Perfil atualizado',
                                style: TextStyle(
                                  color: Color(0xFF2E2E2E),
                                ),
                              ),
                              backgroundColor: Color(0xFFDCDCDD),
                            ),
                          );

                          provider.updateTodo(
                              personData, nameInput.text, emailInput.text);
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
