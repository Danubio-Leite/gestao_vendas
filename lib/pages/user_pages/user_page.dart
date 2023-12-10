import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/memory.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Usurário ativo: ${Provider.of<Memory>(context, listen: false).activeUser.name}',
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Selecione um usuário:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                flex: 9,
                child: ListView.builder(
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
                            onTap: () {
                              selectUser(context, index);
                            },
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
                ),
              ),
            ],
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
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Consumer<Users>(
                builder: (BuildContext context, Users list, _) {
                  return TextButton(
                      child: const Text(
                        "Salvar",
                        style: TextStyle(color: Colors.black),
                      ),
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
                    child: const Text(
                      "Voltar",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Consumer<Users>(
                    builder: (BuildContext context, Users list, _) {
                      return TextButton(
                          child: const Text(
                            "Prosseguir",
                            style: TextStyle(color: Colors.black),
                          ),
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

  void selectUser(context, index) {
    TextEditingController passwordInput = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<Users>(
            builder: (BuildContext context, Users list, _) {
              return AlertDialog(
                scrollable: true,
                title: Text('${list.users[index].name}, digite sua senha:'),
                content: TextFormField(
                  obscureText: true,
                  controller: passwordInput,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    icon: Icon(Icons.key),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text(
                          "Voltar",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Consumer<Users>(
                        builder: (BuildContext context, Users list, _) {
                          return TextButton(
                              child: const Text(
                                "Prosseguir",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                if (passwordInput.text ==
                                    Provider.of<Users>(context, listen: false)
                                        .users[index]
                                        .password) {
                                  setState(() {
                                    Provider.of<Memory>(context, listen: false)
                                        .setActiveUser = list.users[index];
                                  });
                                  Navigator.pop(context);
                                }
                              });
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        });
  }
}
