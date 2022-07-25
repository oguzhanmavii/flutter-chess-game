import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "/product";
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text("Product List Page")),
      body: Container(
        child: Center(
          child: Text("Products"),
        ),
      ),
    );
  }
}
