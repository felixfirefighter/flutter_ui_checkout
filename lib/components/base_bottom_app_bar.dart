import 'package:flutter/material.dart';

class BaseBottomAppBar extends StatelessWidget {
  final String text;
  final Function onPressed;

  BaseBottomAppBar({this.text = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[100],
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24,
        ),
        child: FlatButton(
          padding: EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: Colors.green[700],
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
