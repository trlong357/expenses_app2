import 'package:expenses_app_2/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.deleteTransaction, this.transactionList,
      {super.key});

  final List<Transaction> transactionList;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  alignment: Alignment.center,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Text('\$${transactionList[index].amount}'),
                ),
                title: Text(transactionList[index].title),
                subtitle: Text(
                  DateFormat("dd-MM-yyyy").format(transactionList[index].date),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTransaction(transactionList[index].id),
                ),
              ),
            );
          })),
    );
  }
}
