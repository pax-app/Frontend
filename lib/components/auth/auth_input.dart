import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  AuthInput(
      {@required this.labelText,
      this.obscure = false,
      this.inputType = TextInputType.text});

  final String labelText;
  final bool obscure;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: this.obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff78aa43),
                  style: BorderStyle.solid,
                  width: 1.0)),
          labelText: this.labelText),
    );
  }
}
