import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

    final userData = users.byIndex(1);

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFF2E2E2E),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 300.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF2E2E2E),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
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
                                userData.name,
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
                                    userData.email,
                                    style: TextStyle(
                                      color: Color(0xFFECECEC),
                                      fontSize: 15.0,
                                      fontFamily: 'RobotoSlab',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    return states.contains(MaterialState.pressed)
                        ? Color(0xFF586F7C)
                        : null;
                  },
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFF34817C),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              child: const Text(
                'Perfil',
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 16.0,
                  color: Color(0xFFECECEC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
