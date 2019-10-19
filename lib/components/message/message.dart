import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String hour;
  final MainAxisAlignment messageAligment;

  Message({
    @required this.message,
    @required this.hour,
    @required this.messageAligment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: messageAligment,
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
