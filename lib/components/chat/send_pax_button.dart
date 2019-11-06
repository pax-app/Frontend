import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class SendPaxButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          padding: const EdgeInsets.all(20),
          onPressed: () {},
          shape: const CircleBorder(),
          child: Icon(
            Icons.lock_outline,
            color: colorWhite,
            size: 25,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Pax',
          style: Theme.of(context).textTheme.subtitle,
        ),
      ],
    );
  }
}
