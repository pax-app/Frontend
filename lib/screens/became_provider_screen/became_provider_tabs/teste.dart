import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_priceController.text.isEmpty) return;
    final enteredTitle = _titleController.text;
    final enteredPrice = double.parse(_priceController.text);
    if (enteredTitle.isEmpty || enteredPrice <= 0 || _selectedDate == null)
      return;

    widget.addTransaction(enteredTitle, enteredPrice, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: _priceController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 80,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date:'),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    child: Text('Add Expense'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData),
              )
            ],
          ),
        ),
      ),
    );
  }
}
