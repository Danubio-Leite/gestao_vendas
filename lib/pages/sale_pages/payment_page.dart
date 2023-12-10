import 'package:flutter/material.dart';
import 'package:gestao_vendas/pages/sale_pages/password_page.dart';
import 'package:provider/provider.dart';

import '../../models/memory.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venda'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(94, 81, 122, 129),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  Provider.of<Memory>(context, listen: false).setPayment =
                      'Crédito';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordPage()),
                  );
                },
                child: const Text(
                  'Crédito',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(94, 81, 122, 129),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  Provider.of<Memory>(context, listen: false).setPayment =
                      'Débito';
                  print(Provider.of<Memory>(context, listen: false).payment);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordPage()),
                  );
                },
                child: const Text(
                  'Débito',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
