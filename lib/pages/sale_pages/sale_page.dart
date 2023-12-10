import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_vendas/components/display.dart';
import 'package:gestao_vendas/components/keyboard.dart';
import 'package:gestao_vendas/models/memory.dart';
import 'package:provider/provider.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  _keyPressed(String pressedKey) {
    setState(() {
      Provider.of<Memory>(context, listen: false).addPressedKey(pressedKey);
    });
    print(Provider.of<Memory>(context, listen: false).value);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venda'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Provider.of<Memory>(context, listen: false).memoryClear();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Display(Provider.of<Memory>(context, listen: false).value.toString()),
          Keyboard(_keyPressed)
        ],
      ),
    );
  }
}
