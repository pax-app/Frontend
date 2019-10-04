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
        }, TextInputType.text, 1),
        TextInput('CPF', '000.000.000-00', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.number, 1),
        TextInput('RG', 'RG', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.number, 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: InkWell(
            onTap: () {},
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(3.0)),
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.cloud_upload,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      SizedBox(width: 8.0),
                      new Text('SELFIE COM O RG'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
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
