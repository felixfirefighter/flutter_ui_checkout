import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          color: Colors.purple[900],
          child: Text('Checkout'),
          onPressed: () {},
        ),
      ),
    );
  }
}
