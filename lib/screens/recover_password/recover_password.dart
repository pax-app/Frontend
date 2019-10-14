import 'package:Pax/components/auth/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/auth/auth_input.dart';

class RecoverPassordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff454545),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30, right: 35, left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 80, left: 80),
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  AuthInput(
                    labelText: "E-mail",
                  ),
                  SizedBox(height: 25),
                  AuthInput(labelText: "Confirmar e-mail"),
                  SizedBox(
                    height: 40,
                  ),
                  AuthButton(
                    text: "Recuperar",
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
