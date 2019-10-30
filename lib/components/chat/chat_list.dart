import 'package:Pax/components/chat/date_bubble.dart';
import 'package:Pax/components/message/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatList extends StatelessWidget {
  final formatDate = DateFormat("dd MMMM yyyy", "pt-BR");
  final formatHour = DateFormat("HH:mm", "pt-BR");

  final snapshot;
  final bool isProvider;

  ChatList({
    @required this.snapshot,
    @required this.isProvider,
  });

  @override
  Widget build(BuildContext context) {
    String prevDate =
        formatDate.format(DateTime.parse(snapshot[0]['date_time_sent']));

    bool dateHasChanged = false;

    return ListView.builder(
      reverse: true,
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        String messageSender = snapshot[index]['sender'];
        String currentDate = formatDate
            .format(DateTime.parse(snapshot[index]['date_time_sent']));

        if (currentDate != prevDate) dateHasChanged = true;

        Widget chatList = Column(
          children: <Widget>[
            if (index + 1 == snapshot.length) DateBubble(date: currentDate),
            snapshot[index]['text_message'] != null
                ? Message(
                    isMe: isProvider && messageSender == 'P' ||
                        !isProvider && messageSender == 'U',
                    message: snapshot[index]['text_message'],
                    hour: formatHour.format(
                        DateTime.parse(snapshot[index]['date_time_sent'])),
                  )
                : Image.network(
                    snapshot[index]['path_image'],
                    height: 150,
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
