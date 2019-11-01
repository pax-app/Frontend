import 'package:Pax/screens/chat_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String chat_id;
  final String username;
  final String message;
  final Function longPressHandler;
  final Function toggleChatToDelete;
  final bool isIndeletionMode;

  ChatTile({
    @required this.chat_id,
    @required this.username,
    @required this.message,
    @required this.longPressHandler,
    @required this.isIndeletionMode,
    @required this.toggleChatToDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: Theme.of(context).cardTheme.elevation,
        color: Theme.of(context).cardTheme.color,
        child: InkWell(
          onLongPress: longPressHandler,
          onTap: isIndeletionMode
              ? () => toggleChatToDelete(chat_id)
              : () => _pushChatScreen(context),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: ListTile(
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 2.0,
                  ),
                  color: Colors.lightGreen,
                ),
              ),
              title: Container(
                margin: EdgeInsets.only(bottom: 10),
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

  void _pushChatScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => ChatScreen(
          chat_id: chat_id,
          person_name: username,
        ),
      ),
    );
  }
}
