import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../models/users.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Consumer<Users>(
        builder: (BuildContext context, Users list, _) {
          return ListView.builder(
            itemCount: list.users.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(94, 81, 122, 129),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(list.users[index].name),
                      trailing: IconButton(
                          onPressed: () {
                            deleteUser(context, index);
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addUser(context);
          }),
    );
  }

  void addUser(context) {
    TextEditingController nameInput = TextEditingController();
    TextEditingController passwordInput = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Cadastrar usuário'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
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
                      obscureText: true,
                      controller: passwordInput,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        icon: Icon(Icons.key),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Consumer<Users>(
                builder: (BuildContext context, Users list, _) {
                  return TextButton(
                      child: const Text("Salvar"),
                      onPressed: () async {
                        list.add(
                          User(
                            name: nameInput.text,
                            password: passwordInput.text,
                            id: DateTime.now().toString(),
                          ),
                        );

                        Navigator.pop(context);
                      });
                },
              ),
            ],
          );
        });
  }

  void deleteUser(context, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Excluir Usuário?'),
            content: const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text("Voltar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Consumer<Users>(
                    builder: (BuildContext context, Users list, _) {
                      return TextButton(
                          child: const Text("Prosseguir"),
                          onPressed: () async {
                            list.remove(index);
                            Navigator.pop(context);
                          });
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
