import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/screens/add_adress_screen/adress_screen.dart';
import 'package:flutter/material.dart';

class ChatCepBottomSheet extends StatelessWidget {
  TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: <Widget>[
          TextInput(
            'CEP',
            'Insira seu cep',
            true,
            (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
            TextInputType.number,
            1,
            focus: true,
            controller: _cepController,
            enabled: true,
          ),
          SizedBox(height: 32),
          Button(
            buttonText: 'Buscar',
            tapHandler: () {
              print(_cepController.text);
            },
          )
        ],
      ),
    );
  }
}
