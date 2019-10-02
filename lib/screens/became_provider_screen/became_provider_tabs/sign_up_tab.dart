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
        TextInput('Nome', 'Nome Completo', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            TextInput('Nome', 'Nome Completo', true, (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            })
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Button(
          buttonText: 'Próximo',
          type: 'default',
          tapHandler: () {},
          isSmall: false,
        )
      ],
    );
  }
}
