import 'package:flutter/material.dart';

class SendPaxButton extends StatefulWidget {
  @override
  _SendPaxButtonState createState() => _SendPaxButtonState();
}

class _SendPaxButtonState extends State<SendPaxButton> {
  double _blur_radius = 1.5;
  Offset _offset = new Offset(0, 1.4);

  void _updateShadow() {
    print('oi');
    if (_blur_radius == 1.5) {
      setState(() {
        _blur_radius = 6;
        _offset = new Offset(0, 6);
      });
    } else {
      setState(() {
        _blur_radius = 1.5;
        _offset = new Offset(0, 1.4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .25),
                offset: _offset,
                blurRadius: _blur_radius,
              )
            ],
          ),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              // onTap: _updateShadow,
              // onTapCancel: _updateShadow,
              onTap: _updateShadow,
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
