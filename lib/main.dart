import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_checkout/screens/cart_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Checkout',
      theme: ThemeData(
        cursorColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      routes: {
        '/': (context) => CartScreen(),
      },
      initialRoute: '/',
    );
  }
}
