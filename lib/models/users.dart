import 'package:flutter/material.dart';
import 'package:gestao_vendas/models/user.dart';

class Users extends ChangeNotifier {
  List<User> users;

  Users({
    required this.users,
  });

  void add(User user) {
    users.add(user);
    notifyListeners();
  }

  void remove(int index) {
    users.removeAt(index);
    notifyListeners();
  }
}
