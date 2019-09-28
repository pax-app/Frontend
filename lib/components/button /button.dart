import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(15.0),
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
