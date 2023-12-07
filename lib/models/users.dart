import 'package:flutter/material.dart';
import 'package:gestao_vendas/models/user.dart';

class Users extends ChangeNotifier {
  List<User> users;

  Users({required this.users});
}
