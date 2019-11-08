import 'package:Pax/components/chat/date_bubble.dart';
import 'package:Pax/components/message/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatList extends StatelessWidget {
  final formatDate = DateFormat("dd MMMM yyyy", "pt-BR");
  final formatHour = DateFormat("HH:mm", "pt-BR");

  final snapshot;
  final bool isProvider;

  final Function showPaxDetails;

  ChatList({
    @required this.snapshot,
    @required this.isProvider,
    @required this.showPaxDetails,
  });

  @override
  Widget build(BuildContext context) {
    String prevDate = formatDate.format(DateTime.fromMillisecondsSinceEpoch(
        int.parse(snapshot[0]['date_time_sent'])));

    bool dateHasChanged = false;

    return ListView.builder(
      reverse: true,
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        String messageSender = snapshot[index]['sender'];
        String currentDate = formatDate.format(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(snapshot[index]['date_time_sent'])));

        if (currentDate != prevDate) dateHasChanged = true;

        Widget chatList = Column(
          children: <Widget>[
            if (index + 1 == snapshot.length) DateBubble(date: currentDate),
            Message(
              isMe: isProvider && messageSender == 'P' ||
                  !isProvider && messageSender == 'U',
              message: snapshot[index]['text_message'],
              image: snapshot[index]['path_image'],
              paxTitle: snapshot[index]['pax_title'],
              refused: snapshot[index]['refused'],
              showPaxDetails: showPaxDetails,
              hour: formatHour.format(DateTime.fromMillisecondsSinceEpoch(
                  int.parse(snapshot[index]['date_time_sent']))),
            ),
            if (dateHasChanged) DateBubble(date: prevDate),
          ],
        );

        prevDate = currentDate;
        dateHasChanged = false;

        return chatList;
      },
    );
  }
}
