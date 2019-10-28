import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/auth/auth_input.dart';

class RecoverPassordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo.png'),
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(height: 60),
                  AuthInput(labelText: "E-mail"),
                  SizedBox(height: 25),
                  AuthInput(labelText: "Confirmar e-mail"),
                  SizedBox(height: 40),
                  Button(
                    buttonText: 'Recuperar',
                    tapHandler: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
