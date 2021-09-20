import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../provider/users.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
  }

  static inputDecoration(hintText) {
    return InputDecoration(
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
        color: Colors.red[300],
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
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF34817C),
        ),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color(0xFF34817C),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

    _loadFormData(users.byIndex(1));

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
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: _formData['name'],
                      onSaved: (value) => _formData['name'] = value!,
                      cursorColor: Color(0xFF34817C),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFDCDCDD),
                      ),
                      decoration: inputDecoration('Preencha seu nome'),
                      validator: (value) {
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
                      initialValue: _formData['email'],
                      onSaved: (value) => _formData['email'] = value!,
                      cursorColor: Color(0xFF34817C),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFDCDCDD),
                      ),
                      decoration: inputDecoration('Preencha seu e-mail'),
                      validator: (value) {
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _formKey.currentState!.save();
          final isValid = _formKey.currentState!.validate();
          bool didchange;

          if (isValid) {
            didchange =
                Provider.of<UserProvider>(context, listen: false).didChange(
              User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(),
                  email: _formData['email'].toString()),
            );

            didchange
                ?
                // ignore: unnecessary_statements
                {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Nenhuma alteração realizada :)',
                          style: TextStyle(
                            color: Color(0xFF2E2E2E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: Color(0xFFEEB868),
                      ),
                    )
                  }
                :
                // ignore: unnecessary_statements
                {
                    Provider.of<UserProvider>(context, listen: false).put(
                      User(
                          id: _formData['id'].toString(),
                          name: _formData['name'].toString(),
                          email: _formData['email'].toString()),
                    ),
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Perfil atualizado',
                          style: TextStyle(
                            color: Color(0xFF2E2E2E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: Color(0xFFEEB868),
                      ),
                    )
                  };
          }
        },
        label: const Text('Salvar'),
        splashColor: Color(0xFF586F7C).withOpacity(1),
        hoverColor: Color(0xFF586F7C).withOpacity(1),
        focusColor: Color(0xFF586F7C).withOpacity(1),
        backgroundColor: Color(0xFF34817C),
      ),
    );
  }
}
