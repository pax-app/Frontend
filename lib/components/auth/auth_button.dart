import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  AuthButton({@required this.text, this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        disabledColor: Color(0xff929292),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.5)),
        onPressed: onPressed,
        child: Text(this.text.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16)),
      ),
    );
  }
}
