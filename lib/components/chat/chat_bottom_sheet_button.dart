import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatBottomSheetButton extends StatelessWidget {
  final Function onPressedHandler;
  final IconData icon;
  final String text;

  const ChatBottomSheetButton({
    @required this.onPressedHandler,
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          padding: const EdgeInsets.all(20),
          onPressed: onPressedHandler,
          shape: const CircleBorder(),
          child: Icon(
            icon,
            color: colorWhite,
            size: 30,
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ],
    );
  }
}
