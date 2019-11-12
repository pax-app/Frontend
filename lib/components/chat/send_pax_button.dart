import 'package:flutter/material.dart';

class SendPaxButton extends StatefulWidget {
  final Function onPressHandler;

  const SendPaxButton({this.onPressHandler});

  @override
  _SendPaxButtonState createState() => _SendPaxButtonState();
}

class _SendPaxButtonState extends State<SendPaxButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .26),
                offset: new Offset(0, 1.6),
                blurRadius: 1.5,
              )
            ],
          ),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: widget.onPressHandler,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/logo/logo_symbol.png',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Pax',
          style: Theme.of(context).textTheme.subtitle,
        ),
      ],
    );
  }
}
