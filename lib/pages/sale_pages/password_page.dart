import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/memory.dart';
import '../../models/sale.dart';
import '../../models/sales.dart';
import '../../models/users.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Dígite sua senha:'),
            TextFormField(
              obscureText: true,
              controller: passwordInput,
              decoration: const InputDecoration(
                labelText: 'Senha',
                icon: Icon(Icons.key),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<Sales>(
              builder: (BuildContext context, Sales list, Widget? widget) {
                return ElevatedButton(
                  onPressed: () async {
                    if (passwordInput.text ==
                        Provider.of<Users>(context, listen: false)
                            .users[0]
                            .password) {
                      list.add(
                        Sale(
                          date: DateTime.now().toString(),
                          user: Provider.of<Users>(context, listen: false)
                              .users[0]
                              .name,
                          payment: 'Débito',
                          value:
                              Provider.of<Memory>(context, listen: false).value,
                        ),
                      );

                      Provider.of<Memory>(context, listen: false).memoryClear();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      const snackBar = SnackBar(
                        backgroundColor: Colors.white54,
                        content: Text(
                          'Venda registrada com sucesso.',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      const snackBar = SnackBar(
                        backgroundColor: Colors.white54,
                        content: Text(
                          'Senha incorreta!',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Confirmar'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
