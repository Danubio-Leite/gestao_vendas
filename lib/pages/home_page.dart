import 'package:flutter/material.dart';
import 'package:gestao_vendas/components/home_button.dart';
import 'package:gestao_vendas/pages/sale_pages/sale_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Data e Hora'),
                  ],
                )),
            Expanded(
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
                    route: SalePage(),
                  ),
                  CustomHomeButtom(
                    label: 'Usuários',
                    image: 'assets/images/users.png',
                    route: SalePage(),
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