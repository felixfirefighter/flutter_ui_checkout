import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_checkout/screens/cart_screen.dart';
import 'package:flutter_ui_checkout/screens/checkout_screen.dart';

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
        scaffoldBackgroundColor: Colors.grey[100],
        cursorColor: Colors.white,
        fontFamily: 'Nunito',
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 2,
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
              builder: (_) => CartScreen(),
              settings: settings,
            );
          case '/checkout':
            return CupertinoPageRoute(
              builder: (_) => CheckoutScreen(),
              settings: settings,
            );
          default:
            return CupertinoPageRoute(
              builder: (_) => CartScreen(),
              settings: settings,
            );
        }
      },
      initialRoute: '/',
    );
  }
}
