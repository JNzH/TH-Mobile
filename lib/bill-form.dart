import 'package:flutter/material.dart';
import 'package:th_mobile/main.dart';
import 'models/bill.dart';

class BillFormPage extends StatefulWidget {

  late Bill bill;
  bool isCreating = false;

  BillFormPage(bill, isCreating) {
    this.bill = bill;
    this.isCreating = isCreating;
  }

  @override
  State<StatefulWidget> createState() {
    return _BillFormPageState();
  }
}

class _BillFormPageState extends State<BillFormPage> {

  final _formKey = GlobalKey<FormState>();

  Widget _nameField() {
    return TextFormField(
      initialValue: widget.bill.patientName,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value == "") {
          return "Please input patient name";
        }
      },
      onSaved: (value) {
        widget.bill.patientName = value as String;
      },
    );
  }

  Widget _addressField() {
    return TextFormField(
      initialValue: widget.bill.patientAddress,
      decoration: InputDecoration(labelText: 'Address'),
      validator: (value) {
        if (value == "") {
          return "Please input patient address";
        }
      },
      onSaved: (value) {
        widget.bill.patientAddress = value as String;
      },
    );
  }

  Widget _hospitalField() {
    return TextFormField(
      initialValue: widget.bill.hospitalName,
      decoration: InputDecoration(labelText: 'Hospital'),
      validator: (value) {
        if (value == "") {
          return "Please input hospital name";
        }
      },
      onSaved: (value) {
        widget.bill.hospitalName = value as String;
      },
    );
  }

  Widget _dateField() {
    return InputDatePickerFormField(
      initialDate: widget.bill.dateOfService,
      firstDate: DateTime(1900),
      lastDate: DateTime(2300),
      onDateSaved: (value) {
        widget.bill.dateOfService = value;
      },
    );
  }

  Widget _amountField() {
    return TextFormField(
      initialValue: widget.bill.billAmount.toStringAsFixed(2).toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Amout'),
      validator: (value) {
        if (value == null) {
          return "Please input valid bill amount";
        }
        double? res = double.tryParse(value);
        if (res == null || res < 0) {
          return "Please input valid bill amount";
        }
      },
      onSaved: (value) {
        widget.bill.billAmount = double.parse(value!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.bill.patientName==''? 'Create':'Edit'} Bill"
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _nameField(),
                _addressField(),
                _hospitalField(),
                _dateField(),
                _amountField(),
                SizedBox(height: 50),
                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState == null || !_formKey.currentState!.validate()){
                      return ;
                    }
                    _formKey.currentState?.save();
                    if (widget.isCreating) {
                      bills.add(widget.bill);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16
                    ),
                  ),
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}