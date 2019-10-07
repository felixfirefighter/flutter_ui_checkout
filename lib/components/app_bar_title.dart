import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  AppBarTitle({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
