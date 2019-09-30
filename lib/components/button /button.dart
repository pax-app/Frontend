import 'package:Pax/theme/colors.dart';
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
      width: small ? 140 : double.infinity,
      child: gettypeButton(type, text, function, context),
    );
  }

  Widget gettypeButton(String type, String text, Function function, context) {
    switch (type) {
      case 'outline':
        return OutlineButton(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          highlightedBorderColor: secondaryColorLight,
          splashColor: secondaryColorLight,
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).accentColor,
                ),
          ),
          onPressed: function,
        );
        break;
      case 'danger':
        return OutlineButton(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).errorColor,
                ),
          ),
          onPressed: function,
          borderSide: BorderSide(color: Theme.of(context).errorColor),
          highlightedBorderColor: errorColorLight,
          splashColor: errorColorLight,
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
