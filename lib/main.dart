import 'package:flutter/material.dart';
import 'package:gestao_vendas/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'models/memory.dart';
import 'models/sale.dart';
import 'models/sales.dart';
import 'models/user.dart';
import 'models/users.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => Users(users: [
                User(
                  name: 'Admin',
                  password: 'admin',
                  id: '00',
                )
              ])),
      ChangeNotifierProvider(
          create: (context) => Sales(sales: [
                Sale(
                    date: '10.10.2023',
                    payment: 'Debito',
                    user: Provider.of<Users>(context, listen: false).users[0],
                    value: '1.000,00')
              ])),
      ChangeNotifierProvider(create: (context) => Memory()),
    ],
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 116, 116, 118)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
