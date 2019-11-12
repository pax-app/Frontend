import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class ChatCepBottomSheet extends StatelessWidget {
  final TextEditingController _cepController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInput(
          'CEP',
          'CEP',
          true,
          (String value) => value.isEmpty ? 'Vazio' : 'oi',
          TextInputType.number,
          1,
          controller: _cepController,
          focus: true,
        ),
        SizedBox(height: 32),
        Button(
          buttonText: 'Buscar',
          tapHandler: () {},
        )
      ],
    );
  }
}
