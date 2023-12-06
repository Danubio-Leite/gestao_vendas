import 'package:flutter/material.dart';

import 'confirm_button.dart';
import 'keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) pressed;

  const Keyboard(this.pressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color.fromARGB(255, 194, 192, 192),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyboardButton(
                    text: '1',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '2',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '3',
                    pressed: pressed,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyboardButton(
                    text: '4',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '5',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '6',
                    pressed: pressed,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyboardButton(
                    text: '7',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '8',
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '9',
                    pressed: pressed,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KeyboardButton(
                    text: 'Apagar',
                    color: Colors.red,
                    pressed: pressed,
                  ),
                  KeyboardButton(
                    text: '0',
                    pressed: pressed,
                  ),
                  const ConfirmButton(
                    text: 'Confirmar',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
