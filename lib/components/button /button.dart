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
      child: gettypeButton(type, text, function, context),
    );
  }

  Widget gettypeButton(String type, String text, Function function, context) {
    switch (type) {
      case 'outline':
        return OutlineButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // highlightedBorderColor: Theme.of(context).secondaryHeaderColor,
          // splashColor: Theme.of(context).secondaryHeaderColor,
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).accentColor,
                ),
          ),
          onPressed: function,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
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
          highlightColor: Theme.of(context).errorColor,
          highlightedBorderColor: Colors.white,
        );
        break;
      default:
        return RaisedButton(
          onPressed: function,
          child: Text(text.toUpperCase()),
        );
    }
  }
}
