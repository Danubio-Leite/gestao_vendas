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
            ElevatedButton(
              onPressed: () {
                Provider.of<Memory>(context, listen: false).setPayment =
                    'Crédito';
                print(Provider.of<Memory>(context, listen: false).payment);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordPage()),
                );
              },
              child: const Text('Crédito'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Memory>(context, listen: false).setPayment =
                    'Débito';
                print(Provider.of<Memory>(context, listen: false).payment);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordPage()),
                );
              },
              child: const Text('Débito'),
            ),
          ],
        ),
      ),
    );
  }
}
