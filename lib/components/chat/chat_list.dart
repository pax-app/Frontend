import 'package:Pax/components/message/message.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final formatDate = RegExp(r'\d{4}-\d{2}-\d{2}');
  final formatHour = RegExp(r'\d{2}\:\d{2}');
  final snapshot;
  final bool isProvider;

  ChatList({
    @required this.snapshot,
    @required this.isProvider,
  });

  @override
  Widget build(BuildContext context) {
    String prevDate = formatDate.stringMatch(
      snapshot[0]['date_time_sent'],
    );
    bool dateHasChanged = false;

    return ListView.builder(
      reverse: true,
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        String messageSender = snapshot[index]['sender'];
        String currentDate = formatDate.stringMatch(
          snapshot[index]['date_time_sent'],
        );

        if (currentDate != prevDate) dateHasChanged = true;

        Widget chatList = Column(
          children: <Widget>[
            if (index + 1 == snapshot.length) Text(currentDate),
            Message(
              isMe: isProvider && messageSender == 'P' ||
                  !isProvider && messageSender == 'U',
              message: snapshot[index]['text_message'],
              hour: formatHour.stringMatch(
                snapshot[index]['date_time_sent'],
              ),
            ),
            if (dateHasChanged) Text(prevDate),
          ],
        );
        prevDate = currentDate;
        dateHasChanged = false;
        return chatList;
      },
    );
  }
}
