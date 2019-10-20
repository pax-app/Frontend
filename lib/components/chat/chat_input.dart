import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function sendAction;
  final TextEditingController _messageController = TextEditingController();

  ChatInput({
    @required this.sendAction,
  });

  void _sendMessageHandler() {
    sendAction(_messageController.text);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 4,
            bottom: 4,
            right: 8,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  maxLines: null,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  controller: _messageController,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration.collapsed(
                    hintText: "Digite aqui...",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
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
      ),
    );
  }
}
