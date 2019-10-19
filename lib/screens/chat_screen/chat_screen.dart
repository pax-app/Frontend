import 'package:Pax/components/chat_app_bar/chat_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final Firestore _firestore = Firestore.instance;
  final String chat_id = '3';

  void _sendMessage() {
    String date_time_sent =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    _firestore.collection(chat_id).add({
      'text_message': _messageController.text,
      'sender': 'provider',
      // 'sender': isProvider ? 'P' : 'U',
      'date_time_sent': date_time_sent
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      title: ChatAppBar(
        provider_name: "Rogério Júnior",
        provider_qualification: "Assistência Técnica: Notebook",
      ),
    );

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/illustrations/circle-pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: mediaQuery.size.height * .75,
                child: StreamBuilder(
                  stream: _firestore
                      .collection(chat_id)
                      .orderBy('date_time_sent')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();

                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Text(
                          snapshot.data.documents[index]['text_message'],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
