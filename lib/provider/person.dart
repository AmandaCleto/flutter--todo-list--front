import 'package:flutter/cupertino.dart';
import '../model/Persona.dart';

class PersonProvider extends ChangeNotifier {
  Persona person =
      Persona(name: "Caio o Oliveira", email: "caiooliveira@outlook.com");

  Persona get personData => person;

  void updateTodo(Persona person, String name, String email) {
    person.name = name;
    person.email = email;

    notifyListeners();
  }
}
