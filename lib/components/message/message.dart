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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(isMe ? 15 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 15),
                ),
              ),
              elevation: 1.3,
              margin: EdgeInsets.symmetric(vertical: 3),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 7, left: 18, right: 18),
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
        ],
      ),
    );
  }
}
