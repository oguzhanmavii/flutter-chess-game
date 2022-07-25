import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  static const String routeName = "/customer";
  const CustomerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text("Customer List Page")),
      body: Container(
        child: Center(
          child: Text("Customers"),
        ),
      ),
    );
  }
}
