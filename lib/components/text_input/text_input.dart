import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String textLabel, placeholder;
  final bool small;
  final TextInputType inputType;
  final int lines;
  final bool focus;
  final Stream<String> stream;
  final Function(String) onChanged;

  TextInput(
      this.textLabel, this.placeholder, this.small, this.inputType, this.lines,
      {this.onChanged, this.focus = false, this.stream});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
        child: StreamBuilder<Object>(
            stream: stream,
            builder: (context, snapshot) {
              return TextFormField(
                onChanged: onChanged,
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
                validator: snapshot.hasError ? snapshot.error : null,
                cursorColor: Theme.of(context).accentColor,
                keyboardType: inputType,
                maxLines: lines,
                style: TextStyle(color: Theme.of(context).primaryColor),
              );
            }));
  }
}
