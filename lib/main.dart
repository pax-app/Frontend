import 'package:flutter/material.dart';

void main() => runApp(PaxApp());

class PaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pax',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      showSemanticsDebugger: false,
      home: Container(),
    );
  }
}
