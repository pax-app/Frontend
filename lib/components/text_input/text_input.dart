import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String textLabel, placeholder;
  final bool small;
  final Function validator;
  final TextInputType inputType;
  final int lines;
  final bool focus;
  final TextEditingController controller;

  TextInput(this.textLabel, this.placeholder, this.small, this.validator,
      this.inputType, this.lines,
      {this.focus = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholder,
          labelText: textLabel,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
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
        cursorColor: Theme.of(context).accentColor,
        keyboardType: inputType,
        maxLines: lines,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
