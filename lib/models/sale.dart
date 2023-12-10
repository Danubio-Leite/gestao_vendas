import 'package:gestao_vendas/models/user.dart';

class Sale {
  String date;
  String value;
  String payment;
  User user;
  String approved;

  Sale({
    required this.date,
    required this.value,
    required this.payment,
    required this.user,
    required this.approved,
  });
}
