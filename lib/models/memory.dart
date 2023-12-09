import 'package:flutter/material.dart';

class Memory extends ChangeNotifier {
  String _value = '0';
  bool _wipeValue = false;
  String _payment = '';
  String _date = '';
  String _activeUser = '00';

  void addPressedKey(String pressedKey) {
    if (pressedKey == 'Apagar') {
      _clear();
    } else {
      _addDigit(pressedKey);
    }
  }

  void memoryClear() {
    _clear();
  }

  _addDigit(String digit) {
    final wipeValue = _value == '0' || _wipeValue;
    final currentValue = wipeValue ? '' : _value;
    _value = currentValue + digit;
    _wipeValue = false;
  }

  _clear() {
    _value = '0';
    _payment = '';
    _date = '';
  }

  String get value {
    return _value;
  }

  String get date {
    return _date;
  }

  String get payment {
    return _payment;
  }

  set setPayment(String payment) {
    _payment = payment;
  }

  String get activeUser {
    return _activeUser;
  }
}
