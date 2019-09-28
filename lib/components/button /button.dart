import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function function;
  final String text;
  final String type;
  final bool small;

  Button(this.text, this.function, this.type, this.small);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: small ? null : double.infinity,
        child: gettypeButton(type, text, function, context));
  }

  Widget gettypeButton(String type, String text, Function function, context) {
    switch (type) {
      case 'outline':
        return OutlineButton(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          onPressed: function,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        );
        break;
      case 'danger':
        return OutlineButton(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Theme.of(context).errorColor),
          ),
          onPressed: function,
          borderSide: BorderSide(color: Theme.of(context).errorColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        );
        break;
      default:
        return RaisedButton(
          padding: EdgeInsets.all(15.0),
          onPressed: function,
          child: Text(text.toUpperCase()),
        );
    }
  }
}
