import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function tapHandler;
  final String buttonText;
  final String type;
  final bool isSmall;

  Button({this.buttonText, this.tapHandler, this.type, this.isSmall});

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
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            splashColor: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(30),
            onTap: tapHandler,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: primaryButtonShadow,
                    blurRadius: 4,
                    spreadRadius: 1.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                buttonText.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: colorWhite),
              ),
            ),
          ),
        );
    }
  }
}
