import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/message/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;
  final formatHour = RegExp(r'\d{2}\:\d{2}');

  final String chat_id = '3';
  final bool isProvider = true;

  void _sendMessage(String text) {
    String date_time_sent =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    _firestore.collection(chat_id).document(date_time_sent).setData({
      'text_message': text,
      'sender': isProvider ? 'P' : 'U',
      'date_time_sent': date_time_sent
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatAppBar = ChatAppBar(
      provider_name: "Rogério Júnior",
      provider_qualification: "Assistência Técnica: Notebook",
    );

    final mediaQuery = MediaQuery.of(context);
    final safeBackgroundHeight = mediaQuery.size.height -
        chatAppBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: chatAppBar,
      body: SingleChildScrollView(
        child: Container(
          height: safeBackgroundHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/illustrations/circle-pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: safeBackgroundHeight * .83,
                child: StreamBuilder(
                  stream: _firestore
                      .collection(chat_id)
                      .orderBy('date_time_sent', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();

                    return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        String messageSender =
                            snapshot.data.documents[index]['sender'];

                        return Message(
                          messageAligment: isProvider && messageSender == 'P' ||
                                  !isProvider && messageSender == 'U'
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          message: snapshot.data.documents[index]
                              ['text_message'],
                          hour: formatHour.stringMatch(
                            snapshot.data.documents[index]['date_time_sent'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ChatInput(
                sendAction: _sendMessage,
                componentHeight: safeBackgroundHeight * .13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
