import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleCtrl = TextEditingController();

  final _amountCtrl = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountCtrl.text.isEmpty) return;

    final enteredTitle = _titleCtrl.text;
    final enteredAmount = double.parse(_amountCtrl.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleCtrl,
            onSubmitted: (_) => _submitData()),
        TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountCtrl,
            onSubmitted: (_) => _submitData()),
        Container(
          height: 70,
          child: Row(children: [
            Expanded(
              child: Text(_selectedDate ==null
              ? 'No Date Chosen'
              : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'
              ) ,
              ),
              FlatButton(onPressed: _presentDatePicker, child: Text('Chose Date'))
          ],
          )
        ),
        FlatButton(
          onPressed: _submitData,
          child: Text('Add Transaction'),
          textColor: Colors.purple,
        )
      ],
    ));
  }
}
