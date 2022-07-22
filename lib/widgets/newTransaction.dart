import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addTransaction, {super.key});

  final Function addTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);
    if (enteredAmount == null || enteredTitle.isEmpty) {
      return;
    }
    widget.addTransaction(
      enteredTitle,
      enteredAmount,
      DateTime.now(),
    );
    Navigator.of(context).pop(); // thoat ra ngoai
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: const InputDecoration(labelText: "Amount"),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text("Add new transaction"),
          )
        ],
      ),
    );
  }
}
