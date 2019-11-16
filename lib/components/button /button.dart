import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function tapHandler;
  final String buttonText;
  final String type;
  final bool isSmall;
  final bool isLoading;
  final bool isDisabled;

  Button({
    @required this.buttonText,
    @required this.tapHandler,
    this.type,
    this.isSmall = false,
    this.isLoading = false,
    this.isDisabled,
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
          child: isLoading
              ? getSpinner()
              : Text(
                  buttonText.toUpperCase(),
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                ),
          onPressed: isLoading ? null : tapHandler,
        );
        break;
      case 'danger':
        return OutlineButton(
          child: isLoading
              ? getSpinner()
              : Text(
                  buttonText.toUpperCase(),
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
            color: type == 'warning' ? orangeWarning : null,
            onPressed: isLoading ? null : tapHandler,
            disabledColor: Colors.grey,
            child: isLoading
                ? getSpinner()
                : Text(
                    buttonText.toUpperCase(),
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: colorWhite,
                        ),
                  ),
          ),
        );
    }
  }

  Widget getSpinner() {
    return Container(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
