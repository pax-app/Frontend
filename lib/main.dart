import 'package:Pax/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';

void main() => runApp(PaxApp());

class PaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pax',
      theme: paxTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
