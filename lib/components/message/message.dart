import 'package:Pax/components/chat/image_bubble.dart';
import 'package:Pax/components/chat/pax_bubble.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String image;
  final String hour;
  final String paxTitle;
  final bool refused;
  final bool isMe;
  final Function showPaxDetails;

  Message({
    @required this.message,
    @required this.hour,
    @required this.isMe,
    @required this.image,
    @required this.paxTitle,
    @required this.refused,
    @required this.showPaxDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              onTap: paxTitle != null && !refused
                  ? () => showPaxDetails(context)
                  : () {},
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 15,
                  right: 15,
                  bottom: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(isMe ? 15 : 0),
                    bottomRight: Radius.circular(isMe ? 0 : 15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      refused == true
                          ? Colors.red
                          : isMe ? secondaryColorLight : Colors.white,
                      refused == true
                          ? Colors.red
                          : isMe ? secondaryColor : Color(0xfff3f3f3),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: refused == true
                          ? Colors.black54
                          : isMe ? secondaryColor : Color.fromRGBO(0, 0, 0, .3),
                      offset: Offset(0, 2),
                      blurRadius: 3.2,
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    if (message != null)
                      Text(
                        message,
                        style:
                            TextStyle(color: isMe ? colorWhite : primaryColor),
                      ),
                    if (image != null) ImageBubble(image: image, isMe: isMe),
                    if (paxTitle != null)
                      PaxBubble(paxTitle: paxTitle, refused: refused),
                    Text(
                      hour,
                      style: TextStyle(
                        color: isMe
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).accentColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
