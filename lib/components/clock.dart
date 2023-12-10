import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _currentTime = '';
  String _currentDate = '';
  DateTime data = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Atualiza o tempo e a data a cada segundo
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimeAndDate();
    });
    // Atualiza pela primeira vez ao criar o widget
    _updateTimeAndDate();
  }

  void _updateTimeAndDate() {
    setState(() {
      _currentTime = _getCurrentTime();
      _currentDate = _getCurrentDate();
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return '${_formatTwoDigits(now.hour)}:${_formatTwoDigits(now.minute)}:${_formatTwoDigits(now.second)}';
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    return '${_formatTwoDigits(now.day)}/${_formatTwoDigits(now.month)}/${now.year}';
  }

  String _formatTwoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt-BR');
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(94, 81, 122, 129),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentTime,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '${DateFormat("EEEE", "pt_BR").format(data)}, ${DateFormat("d").format(data)} de ${DateFormat("MMMM", "pt_BR").format(data)}'
                  .toUpperCase(),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
