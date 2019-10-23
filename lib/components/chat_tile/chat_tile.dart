import 'package:Pax/screens/chat_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String chat_id;
  final String username;
  final String message;

  ChatTile({
    @required this.chat_id,
    @required this.username,
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: Theme.of(context).cardTheme.elevation,
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => ChatScreen(
                  chat_id: chat_id,
                  person_name: username,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 50,
              ),
              title: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  this.username,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              subtitle: Text(
                this.message.length >= 31
                    ? '${this.message.substring(0, 31)}...'
                    : this.message,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
