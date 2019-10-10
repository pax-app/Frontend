import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String hour;

  Message({@required this.message, @required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(),
    );
  }
}
