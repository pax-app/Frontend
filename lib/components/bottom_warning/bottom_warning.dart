import 'package:flutter/material.dart';

class BottomWarning extends StatelessWidget {
  final IconData icon;
  final String text;

  const BottomWarning({
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(icon, size: 30),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle,
        )
      ],
    );
  }
}
