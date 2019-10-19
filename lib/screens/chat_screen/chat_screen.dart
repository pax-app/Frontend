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
              Container(
                height: safeBackgroundHeight * .13,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 6,
                      bottom: 6,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            controller: _messageController,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration.collapsed(
                              hintText: "Digite aqui",
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.attach_file),
                          color: Theme.of(context).accentColor,
                        ),
                        IconButton(
                          onPressed: _sendMessage,
                          icon: Icon(Icons.send),
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
