import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/chat/chat_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;

  final String chat_id = '4';
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
                    
                    // print();

                    return ChatList(
                      snapshot: snapshot.data.documents,
                      isProvider: isProvider,
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
    );
  }
}
