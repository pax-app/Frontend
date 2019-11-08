import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function tapHandler;
  final String buttonText;
  final String type;
  final bool isSmall;
  final bool isLoading;

  Button({
    @required this.buttonText,
    @required this.tapHandler,
    this.type,
    this.isSmall = false,
    this.isLoading = false,
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
          highlightedBorderColor: secondaryColorDimmed,
          splashColor: secondaryColorDimmed,
          child: Text(
            isLoading ? 'Carregando...' : buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).accentColor,
                ),
          ),
          onPressed: isLoading ? null : tapHandler,
        );
        break;
      case 'danger':
        return OutlineButton(
          child: Text(
            isLoading ? 'Carregando...' : buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).errorColor,
                ),
          ),
          onPressed: isLoading ? null : tapHandler,
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
            onPressed: isLoading ? null : tapHandler,
            child: Text(
              isLoading ? 'Carregando...' : buttonText.toUpperCase(),
              style: Theme.of(context).textTheme.title.copyWith(
                    color: colorWhite,
                  ),
            ),
          ),
        );
    }
  }
}
