import 'dart:math';

import 'package:flutter/cupertino.dart';
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

  //update // create
  void put(User user) {
    //update
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey((user.id))) {
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
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
