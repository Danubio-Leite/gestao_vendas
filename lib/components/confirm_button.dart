import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/memory.dart';
import '../pages/sale_pages/payment_page.dart';

class ConfirmButton extends StatelessWidget {
  static const DEFAULT = Colors.green;

  final String text;
  final Color color;

  const ConfirmButton({
    super.key,
    required this.text,
    this.color = DEFAULT,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Memory>(
      builder: (BuildContext context, Memory memory, _) {
        return Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
            onPressed: () {
              //memory aparentemente zerado
              print(memory.value);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
