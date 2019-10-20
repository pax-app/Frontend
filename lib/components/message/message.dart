import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String hour;
  final bool isMe;

  Message({
    @required this.message,
    @required this.hour,
    @required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                    ),
            ),
            elevation: 1,
            margin: EdgeInsets.symmetric(vertical: 3),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 14,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(message),
                  Text(
                    hour,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

        // Flexible(
        //   fit: FlexFit.loose,
        //   child: Card(
        //     child: Column(
        //       children: <Widget>[
        //         Text(message),
        //         Text(hour),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
