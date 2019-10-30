import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/screens/add_adress_screen/cep_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AdressScreen extends StatefulWidget {
  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  TextEditingController _bio = TextEditingController(text: 'Initial value');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        TextInput(
          'Logradouro',
          'Insira uma descrição sobre você',
          true,
          (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
          TextInputType.text,
          1,
          focus: true,
          controller: _bio,
        ),
      ],
    ));
  }
}
