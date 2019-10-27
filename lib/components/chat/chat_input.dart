import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function sendAction;
  final Function openBottomSheet;
  final TextEditingController _messageController = TextEditingController();

  ChatInput({
    @required this.sendAction,
    @required this.openBottomSheet,
  });

  void _sendMessageHandler() {
    if (_messageController.text.isEmpty) return;
    sendAction(_messageController.text);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border(top: BorderSide(color: Theme.of(context).accentColor)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 3.5,
          bottom: 3.5,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLines: null,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
                controller: _messageController,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration.collapsed(
                  hintText: "Digite aqui...",
                ),
              ),
            ),
            IconButton(
              onPressed: openBottomSheet,
              icon: Icon(Icons.attach_file),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: _sendMessageHandler,
              icon: Icon(Icons.send),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
