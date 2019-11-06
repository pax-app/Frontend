import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/screens/add_adress_screen/adress_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCepBottomSheet extends StatefulWidget {
  @override
  _ChatCepBottomSheetState createState() => _ChatCepBottomSheetState();
}

class _ChatCepBottomSheetState extends State<ChatCepBottomSheet> {
  final TextEditingController _cepController = TextEditingController();

  void _pushAddressScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => AdressScreen()),
    );
  }

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
            tapHandler: () => _pushAddressScreen(context),
          )
        ],
      ),
    );
  }
}
