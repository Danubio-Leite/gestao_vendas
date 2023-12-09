import 'package:flutter/material.dart';

class Memory extends ChangeNotifier {
  String _value = '0';
  bool _wipeValue = false;

  void addPressedKey(String pressedKey) {
    if (pressedKey == 'Apagar') {
      _clear();
    } else {
      _addDigit(pressedKey);
    }
  }

  _addDigit(String digit) {
    final wipeValue = _value == '0' || _wipeValue;
    final currentValue = wipeValue ? '' : _value;
    _value = currentValue + digit;
    _wipeValue = false;
  }

  _clear() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}
