import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function tapHandler;
  final String buttonText;
  final String type;
  final bool isSmall;

  Button({
    @required this.buttonText,
    @required this.tapHandler,
    @required this.type,
    @required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmall ? 140 : double.infinity,
      child: gettypeButton(type, buttonText, tapHandler, context),
    );
  }

  Widget gettypeButton(
    String type,
    String buttonText,
    Function tapHandler,
    context,
  ) {
    switch (type) {
      case 'outline':
        return OutlineButton(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          highlightedBorderColor: secondaryColorLight,
          splashColor: secondaryColorLight,
          child: Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).accentColor,
                ),
          ),
          onPressed: tapHandler,
        );
        break;
      case 'danger':
        return OutlineButton(
          child: Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).errorColor,
                ),
          ),
          onPressed: tapHandler,
          borderSide: BorderSide(color: Theme.of(context).errorColor),
          highlightedBorderColor: errorColorLight,
          splashColor: errorColorLight,
        );
        break;
      default:
        return Material(
          borderRadius: BorderRadius.circular(30),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            onPressed: tapHandler,
            child: Text(
              buttonText.toUpperCase(),
              style: Theme.of(context).textTheme.title.copyWith(
                    color: colorWhite,
                  ),
            ),
          ),
        );
    }
  }
}
