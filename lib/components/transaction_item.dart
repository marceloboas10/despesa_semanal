import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.removeTransaction,
  });

  final Transaction tr;
  final void Function(int p1) removeTransaction;

  @override
  Widget build(BuildContext context) {
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
  }
}