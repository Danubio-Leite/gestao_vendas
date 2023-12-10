import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../models/users.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController passwordInput2 = TextEditingController();
  String _passwordError = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuário'),
      ),
      body: Consumer<Users>(
        builder: (BuildContext context, Users list, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: nameInput,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          icon: Icon(Icons.account_box),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        validator: (value) {
                          if (passwordInput.toString().length < 4) {
                            _passwordError =
                                'Suas senha deve ter pelo menos quatro caracteres.';
                          }
                          if (passwordInput != passwordInput2) {
                            _passwordError = 'Senhas digitadas não conferem.';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordInput,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          icon: Icon(Icons.key),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (passwordInput.toString().length < 4) {
                            _passwordError =
                                'Suas senha deve ter pelo menos quatro caracteres.';
                          }
                          if (passwordInput != passwordInput2) {
                            _passwordError = 'Senhas digitadas não conferem.';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordInput2,
                        decoration: const InputDecoration(
                          labelText: 'Confirme sua senha',
                          icon: Icon(Icons.key),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _passwordError,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                          if (_formKey.currentState!.validate()) {
                            list.add(
                              User(
                                name: nameInput.text,
                                password: passwordInput.text,
                                id: DateTime.now().toString(),
                              ),
                            );

                            //Navigator.pop(context);
                          } else {}
                        },
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
