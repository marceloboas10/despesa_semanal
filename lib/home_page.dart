import 'dart:math';
import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/total.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    var newTransaction = Transaction(
        id: Random().nextInt(100), price: value, title: title, date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.pop(context);
  }

  _removeTransaction(int id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSubmit: _addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Despesas Semanais'),
      actions: [
        IconButton(
          onPressed: () => _openTransactionModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
    final avaliableHeigth = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: avaliableHeigth * 0.28,
                child: Chart(_recentTransactions)),
            Column(
              children: [
                SizedBox(
                    height: avaliableHeigth * 0.03,
                    child: Total(recentTransaction: _recentTransactions)),
                SizedBox(
                  height: avaliableHeigth * 0.69,
                  child: TransactionList(
                      transactions: _transactions,
                      removeTransaction: _removeTransaction),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 8,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add_sharp, color: Colors.white),
          onPressed: () {
            _openTransactionModal(context);
          }),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
