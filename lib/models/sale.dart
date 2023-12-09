import 'package:gestao_vendas/models/user.dart';

class Sale {
  String date;
  String value;
  String payment;
  User user;

  Sale({
    required this.date,
    required this.value,
    required this.payment,
    required this.user,
  });
}
