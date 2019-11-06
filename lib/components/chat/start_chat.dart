import 'package:flutter/material.dart';

class StartChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/illustrations/chatting.png',
          height: 120,
        ),
        SizedBox(height: 10),
        Text(
          'Inicie a conversa :)',
          style: Theme.of(context).textTheme.title,
        ),
      ],
    );
  }
}
