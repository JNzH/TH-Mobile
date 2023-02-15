import 'package:flutter/material.dart';
import 'package:th_mobile/bill-form.dart';
import 'package:th_mobile/bill-summary.dart';
import 'models/bill.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Truffle Health demo',
        theme: ThemeData(
            primarySwatch: Colors.teal
        ),
        home: HomePage()
    );
  }
}

List<Bill> bills = [
  Bill("Alex", DateTime(2000), "111 St, NY", "Mary hospital", 4.99),
  Bill("Becky", DateTime(2000), "222 St, Los Angles, CA", "Lee hospital", 15),
  Bill("Chris", DateTime(2000), "333 St, Seattle, WA", "John hospital", 30),
  Bill("David", DateTime(2000), "44 St, NJ", "Smith hospital", 17.22),
  Bill("Eddy", DateTime(2000), "78 Dr, WA", "Lee hospital", 44.33),
  Bill("Frank", DateTime(2000), "999 Rd, Chicago, IL", "Sunny hospital", 19.95),
  Bill("Gary", DateTime(2000), "OH", "Care hospital", 16.27),
  Bill("Helen", DateTime(2000), "VA", "Lee hospital", 22.33),
  Bill("Ivy", DateTime(2000), "CA", "Care hospital", 39),
  Bill("Jack", DateTime(2000), "FL", "Lee hospital", 50),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Truffle Health Demo"
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(24),
        child: _buildBillsListView(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.withOpacity(0.75),
        onPressed: ()  {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BillFormPage(Bill("", DateTime.now()), true))
          ).then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildBillsListView(BuildContext context) {
    return ListView.separated(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return _buildBillsListTile(context, index);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 15);
      },
    );
  }


  ListTile _buildBillsListTile(BuildContext context, int index) {
    return ListTile(
      // tileColor: Colors.,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.teal),
          borderRadius: BorderRadius.circular(20)
      ),
      leading: Icon(Icons.medical_information, size: 30),
      title: Text(
        bills[index].patientName,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),
      subtitle: Text(bills[index].hospitalName),
      trailing: const Icon(Icons.chevron_right, size: 30),
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BillSummaryPage(bills[index]))
        ).then((value) => setState(() {}));
      },
    );
  }


}