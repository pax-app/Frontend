import 'dart:async';

import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/message/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;
  final formatDate = RegExp(r'\d{4}-\d{2}-\d{2}');
  final formatHour = RegExp(r'\d{2}\:\d{2}');

  final String chat_id = '4';
  final bool isProvider = true;
  final ScrollController _scrollController = new ScrollController();

  void _sendMessage(String text) {
    String date_time_sent =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    // _firestore.collection(chat_id).document('20/11').collection('2019/02').add({

    _firestore.collection(chat_id).document(date_time_sent).setData({
      'text_message': text,
      'sender': isProvider ? 'P' : 'U',
      'date_time_sent': date_time_sent
    });
    _scrollController.jumpTo(0);
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                Container(
                  height: safeBackgroundHeight * .85,
                  child: StreamBuilder(
                    stream: _firestore
                        .collection(chat_id)
                        .orderBy('date_time_sent', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      if (snapshot.data.documents.length <= 0)
                        return Text('Inicie a conversa :)');
                      String prevDate = formatDate.stringMatch(
                        snapshot.data.documents[0]['date_time_sent'],
                      );
                      bool dateHasChanged = false;

                      return ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          String messageSender =
                              snapshot.data.documents[index]['sender'];

                          String currentDate = formatDate.stringMatch(
                            snapshot.data.documents[index]['date_time_sent'],
                          );

                          if (currentDate != prevDate) dateHasChanged = true;

                          Widget chatList = Column(
                            children: <Widget>[
                              if (index + 1 == snapshot.data.documents.length)
                                Text(currentDate),
                              Message(
                                isMe: isProvider && messageSender == 'P' ||
                                    !isProvider && messageSender == 'U',
                                message: snapshot.data.documents[index]
                                    ['text_message'],
                                hour: formatHour.stringMatch(
                                  snapshot.data.documents[index]
                                      ['date_time_sent'],
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
                    },
                  ),
                ),
                ChatInput(
                  sendAction: _sendMessage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
