import 'package:flutter/material.dart';
import 'model/transaction.dart';
import 'widgets/transactionList.dart';
import 'widgets/newTransaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "1",
      title: "Nike AF1",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
        id: "2",
        title: "iPhone 13 Pro Max",
        amount: 1500,
        date: DateTime.parse("2022-07-01")),
    Transaction(
        id: "3",
        title: "MacBook Pro M1",
        amount: 2900,
        date: DateTime.parse("2022-05-27")),
    Transaction(
        id: "4",
        title: "Apple Watch series 6",
        amount: 700,
        date: DateTime.now())
  ];

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  void _showAddingTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title),
          ),
      body: ListView(
        children: [
          Text("chart"),
          TransactionList(_deleteTransaction, _transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddingTransactionModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
