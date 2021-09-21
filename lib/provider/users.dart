import 'dart:math';
import 'package:flutter/material.dart';
import '../model/User.dart';
import '../data/dummy_users.dart';

class UserProvider extends ChangeNotifier {
  final Map<String, User> _items = {...dummy_users};
  final id = Random().nextDouble().toString();

  //get
  List<User> get all {
    return [..._items.values];
  }

  //get by index
  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  //verify if no changes has happened
  bool didChange(User user) {
    final targetId = _items.containsKey((user.id));
    bool result = false;

    //exists?
    if (targetId) {
      _items.forEach((key, value) {
        if (key == user.id &&
            value.name == user.name &&
            value.email == user.email) {
          result = true;
        }
      });
    }

    return result;
  }

  //update // create
  void put(User user) {
    final targetId = _items.containsKey((user.id));

    //update
    if (user.id.trim().isNotEmpty && targetId) {
      _items.update(
        user.id,
        (_) => User(id: user.id, name: user.name, email: user.email),
      );
    } else {
      //create
      _items.putIfAbsent(
        id,
        () => User(id: user.id, name: user.name, email: user.email),
      );
    }

    notifyListeners();
  }

  //delete
  void remove(User user) {
    _items.remove(user.id);
    notifyListeners();
  }
}
