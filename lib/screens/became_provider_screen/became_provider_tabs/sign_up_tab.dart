import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        TextInput('Nome', 'Nome Completo', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.text, 1),
        TextInput('CPF', '000.000.000-00', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.number, 1),
        
        SizedBox(
          height: 70.0,
        ),
        Button(
          buttonText: 'Próximo',
          type: 'default',
          tapHandler: () {},
          isSmall: false,
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
