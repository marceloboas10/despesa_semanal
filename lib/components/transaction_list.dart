import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {super.key, this.transactions, required this.removeTransaction});

  final List<Transaction>? transactions;
  final void Function(int) removeTransaction;

  @override
  Widget build(BuildContext context) {
    return transactions!.isEmpty
        ? Column(children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Sem dados para exibir',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 49,
            ),
            SizedBox(
              height: 300,
              child: Image.asset(
                'assets/image/waiting.png',
                fit: BoxFit.cover,
              ),
            )
          ])
        : ListView.builder(
            itemCount: transactions!.length,
            itemBuilder: (context, index) {
              final tr = transactions![index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                          child: Text(
                        'R\$${tr.price.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(DateFormat('dd/MM/yyyy').format(tr.date)),
                  trailing: IconButton(
                    onPressed: () {
                      removeTransaction(tr.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
  }
}
