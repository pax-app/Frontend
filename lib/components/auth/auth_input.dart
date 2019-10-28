import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String labelText;
  final bool obscure;
  final TextInputType inputType;
  final Stream<String> stream;
  final Function(String) onChanged;

  AuthInput({
    @required this.labelText,
    this.obscure = false,
    this.inputType = TextInputType.text,
    this.stream,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: onChanged,
          keyboardType: inputType,
          obscureText: this.obscure,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff78aa43),
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            labelText: this.labelText,
            errorText: snapshot.hasError ? snapshot.error : null,
          ),
        );
      },
    );
  }
}
