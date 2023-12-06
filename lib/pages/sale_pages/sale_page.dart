import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_vendas/components/display.dart';
import 'package:gestao_vendas/components/keyboard.dart';
import 'package:gestao_vendas/models/memory.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final Memory memory = Memory();

  _keyPressed(String pressedKey) {
    setState(() {
      memory.addPressedKey(pressedKey);
    });
    print(memory.value);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venda'),
      ),
      body: Column(
        children: [Display(memory.value), Keyboard(_keyPressed)],
      ),
    );
  }
}
