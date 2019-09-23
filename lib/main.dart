import 'package:flutter/material.dart';
import 'package:pax_front_end/screens/home_screen/home_screen.dart';

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
      home: HomeScreen(),
    );
  }
}
