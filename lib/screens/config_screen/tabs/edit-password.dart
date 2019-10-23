import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class EditPasswordTab extends StatefulWidget {
  _EditPasswordTabState createState() => _EditPasswordTabState();
}

class _EditPasswordTabState extends State<EditPasswordTab> {
  TextEditingController _lastPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInput(
          'Senha Antiga',
          '',
          true,
          (String value) {
            return _lastPassword.text.isEmpty ? 'Texto Vazio' : null;
          },
          TextInputType.text,
          1,
          controller: _lastPassword,
        ),
        TextInput(
          'Nova Senha',
          '',
          true,
          (String value) {
            return _newPassword.text.isEmpty ? 'Texto Vazio' : null;
          },
          TextInputType.text,
          1,
          controller: _newPassword,
        ),
        TextInput(
          'Confirmar Nova Senha',
          '',
          true,
          (String value) {
            return _confirmNewPassword.text.isEmpty ? 'Texto Vazio' : null;
          },
          TextInputType.text,
          1,
          controller: _confirmNewPassword,
        ),
        SizedBox(
          height: 180.0,
        ),
        Button(
          buttonText: 'Salvar',
          type: 'default',
          tapHandler: null,
          isSmall: false,
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
