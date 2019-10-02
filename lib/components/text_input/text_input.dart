import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String textLabel, placeholder;
  final bool small;
  final Function validator;

  TextInput(this.textLabel, this.placeholder, this.small, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: textLabel,
        labelText: placeholder,
        labelStyle: TextStyle(color: Theme.of(context).accentColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
              width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).accentColor,
              style: BorderStyle.solid,
              width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).errorColor,
              style: BorderStyle.solid,
              width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).errorColor,
              style: BorderStyle.solid,
              width: 1.0),
        ),
      ),
      validator: validator,
      style: TextStyle(color: Theme.of(context).primaryColor),
    );
  }
}
