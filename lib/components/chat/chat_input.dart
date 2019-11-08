import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function sendAction;
  final Function openBottomSheet;

  ChatInput({
    @required this.sendAction,
    @required this.openBottomSheet,
  });

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessageHandler() {
    if (_messageController.text.isEmpty) return;
    widget.sendAction(_messageController.text, false, false);
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
              onPressed: widget.openBottomSheet,
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
