import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/sales.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório'),
      ),
      body: Consumer<Sales>(builder: (BuildContext context, Sales list, _) {
        return ListView.builder(
          itemCount: list.sales.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              child: ListTile(
                title: Column(
                  children: [
                    Text(list.sales[index].date),
                    Text(list.sales[index].value),
                    Text(list.sales[index].payment),
                    Text(list.sales[index].user),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {
                      list.remove(index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          },
        );
      }),
    );
  }
}
