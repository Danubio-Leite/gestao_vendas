import 'package:flutter/material.dart';
import 'package:gestao_vendas/models/sale.dart';

class Sales extends ChangeNotifier {
  List<Sale> sales;

  Sales({required this.sales});

  void add(Sale sale) {
    sales.add(sale);
    notifyListeners();
  }

  void remove(int index) {
    sales.removeAt(index);
    notifyListeners();
  }
}
