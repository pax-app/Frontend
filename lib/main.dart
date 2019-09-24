import 'package:flutter/material.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';

void main() => runApp(PaxApp());

class PaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pax',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(124, 179, 66, 1),
        scaffoldBackgroundColor: Color.fromRGBO(247, 247, 247, 1),
        textSelectionColor: Color.fromRGBO(28, 25, 25, 1),
        errorColor: Color.fromRGBO(255, 75, 75, 1),

      ),
      showSemanticsDebugger: false,
      home: HomeScreen(),
    );
  }
}
