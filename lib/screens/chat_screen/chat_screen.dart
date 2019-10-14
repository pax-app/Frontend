import 'package:Pax/components/chat_app_bar/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      widget.channel.sink.add(_messageController.text);
      print(_messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        title: ChatAppBar(
          provider_name: "Rogério Júnior",
          provider_qualification: "Assistência Técnica: Notebook",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _sendMessage,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/illustrations/circle-pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _messageController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(labelText: "Send a message"),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (ctx, snapshot) {
                return Text(snapshot.hasData ? "${snapshot.data}" : " ");
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
