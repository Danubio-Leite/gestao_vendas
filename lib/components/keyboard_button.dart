import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  static const DEFAULT = Color.fromARGB(255, 194, 192, 192);

  final String text;
  final Color color;
  final void Function(String) pressed;

  const KeyboardButton({
    super.key,
    required this.text,
    this.color = DEFAULT,
    required this.pressed,
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
        onPressed: () => pressed(text),
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
