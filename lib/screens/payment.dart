import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static const String id = 'payment';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
    );
  }
}
