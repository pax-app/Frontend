import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String hour;
  final String sender;

  Message({
    @required this.message,
    @required this.hour,
    @required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: sender,
      children: <Widget>[
        Card(
          child: Column(
            children: <Widget>[
              Text(message),
              Text(hour),
            ],
          ),
        ),
      ],
    );
  }
}
