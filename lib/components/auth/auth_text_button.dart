import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final Function onTapHandler;
  final String text;
  final bool isPrimary;
  const AuthTextButton({
    this.onTapHandler,
    this.text,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTapHandler,
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          text,
          style: isPrimary
              ? Theme.of(context).textTheme.body2.copyWith(
                    color: Theme.of(context).accentColor,
                  )
              : Theme.of(context).textTheme.body2,
        ),
      ),
    );
  }
}
