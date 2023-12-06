import 'package:flutter/material.dart';

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
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.0),
          ),
        ),
        onPressed: () {
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
  }
}
