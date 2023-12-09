import 'package:flutter/material.dart';
import 'package:gestao_vendas/components/home_button.dart';
import 'package:gestao_vendas/pages/reports_pages/reports_page.dart';
import 'package:gestao_vendas/pages/sale_pages/sale_page.dart';
import 'package:gestao_vendas/pages/user_pages/user_page.dart';

import '../components/clock.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<User>? temp;
  // List<User> users = <User>[];

  // void _addUsers() async {
  //   List temp = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const UserPage()),
  //   );

  //   if (users != null) {
  //     setState(() {
  //       users.addAll(users);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClockWidget(),
                  ],
                )),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHomeButtom(
                    label: 'Venda',
                    image: 'assets/images/sale.png',
                    route: SalePage(),
                  ),
                  CustomHomeButtom(
                    label: 'Relatórios',
                    image: 'assets/images/rel.png',
                    route: ReportPage(),
                  ),
                  CustomHomeButtom(
                    label: 'Usuários',
                    image: 'assets/images/users.png',
                    route: UserPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
