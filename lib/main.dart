import 'package:flutter/material.dart';
import 'package:gestao_vendas/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'models/users.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Users(users: [User(name: 'Admin', password: 'admin')]),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 116, 116, 118)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
