import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class ChatCepBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Adicine seu endereço'),
        Button(
          buttonText: 'Buscar',
          tapHandler: () {},
        )
      ],
    );
  }
}
