import 'package:flutter/material.dart';
import 'bill-form.dart';
import 'models/bill.dart';
import 'package:th_mobile/main.dart';
import 'package:intl/intl.dart';

class BillSummaryPage extends StatefulWidget {

  late Bill bill;

  BillSummaryPage(bill) {
    this.bill = bill;
  }

  @override
  _BillSummaryPageState createState() => _BillSummaryPageState();
}

class _BillSummaryPageState extends State<BillSummaryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Summary'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              widget.bill.patientName,
              style: TextStyle(
                fontSize: 30
              ),
            ),
            SizedBox(height: 50),
            Text('Address: ${widget.bill.patientAddress}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text('Hospital: ${widget.bill.hospitalName}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text('Date of service: ${DateFormat.yMd().format(widget.bill.dateOfService)}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text('Bill amount: \$${widget.bill.billAmount.toStringAsFixed(2).toString()}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            OutlinedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BillFormPage(widget.bill, false))
                  ).then((value) => setState(() {}));
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 17
                  ),
                ),
            ),
            OutlinedButton(
              onPressed: () async {
                final result = await showDialog<bool> (
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('This action will permanently delete this bill'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ],
                  ),
                );

                if (result == null || !result) {
                  Navigator.pop(context);
                  return;
                }

                bills.removeWhere((bill) => bill == widget.bill);
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 17
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}