import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/sales.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório'),
      ),
      body: Consumer<Sales>(builder: (BuildContext context, Sales list, _) {
        return SizedBox(
          child: ListView.builder(
            itemCount: list.sales.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data: ${list.sales[index].date.replaceAll("00:00:00.000", "")}',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Valor: ${currencyFormatter.format(double.parse(list.sales[index].value) / 100)}',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Forma: ${list.sales[index].payment}',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'Usuário: ${list.sales[index].user.name}',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              list.sales[index].approved,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color:
                                      list.sales[index].approved == 'Aprovada'
                                          ? Colors.green
                                          : Colors.red),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              deleteReport(context, index);
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  void deleteReport(context, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Excluir Transação?'),
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
                  Consumer<Sales>(
                    builder: (BuildContext context, Sales list, _) {
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
}
