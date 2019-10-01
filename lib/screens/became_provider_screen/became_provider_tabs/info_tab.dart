import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Em algumas etapas você estará pronto para prestar seviços:',
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }
}
