import 'package:despesas_pessoais/components/transaction_item.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';


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

              return TransactionItem(tr: tr, removeTransaction: removeTransaction);
            },
          );
  }
}


