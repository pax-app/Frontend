import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function sendAction;
  final double componentHeight;
  final TextEditingController _messageController = TextEditingController();

  ChatInput({
    @required this.componentHeight,
    @required this.sendAction,
  });

  void _sendMessageHandler() {
    sendAction(_messageController.text);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: componentHeight,
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
                  style: TextStyle(color: Theme.of(context).primaryColor),
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
