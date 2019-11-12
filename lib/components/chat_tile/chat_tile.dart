import 'package:Pax/screens/chat_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final int chat_id;
  final String username;
  final String message;
  final bool isInDeletionMode;
  final bool isChatSelected;

  final Function longPressHandler;
  final Function updateChatsToBeDeleted;

  ChatTile({
    @required this.chat_id,
    @required this.username,
    @required this.message,
    @required this.isInDeletionMode,
    @required this.isChatSelected,
    @required this.longPressHandler,
    @required this.updateChatsToBeDeleted,
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
          onLongPress: isInDeletionMode == false
              ? () => longPressHandler(chat_id)
              : () => updateChatsToBeDeleted(chat_id),
          onTap: isInDeletionMode == true
              ? () => updateChatsToBeDeleted(chat_id)
              : () => _pushChatScreen(context),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
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
                  AnimatedContainer(
                    duration: Duration(milliseconds: 220),
                    width: isChatSelected ? 28 : 20,
                    height: isChatSelected ? 28 : 20,
                    decoration: BoxDecoration(
                      color: isChatSelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.check,
                      color: isChatSelected ? Colors.white : Colors.transparent,
                      size: 18,
                    ),
                  ),
                ],
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
          chatId: chat_id,
          personName: username,
        ),
      ),
    );
  }
}
