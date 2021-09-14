import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Container(
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
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
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
                      initialValue: "Caio o Oliveira",
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
                      initialValue: "caioliveira@gmail.com",
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
                        padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                        ),
                      ),
                      onPressed: () {},
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
