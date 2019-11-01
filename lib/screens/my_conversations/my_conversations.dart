import 'dart:collection';

import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyConversations extends StatefulWidget {
  final Widget drawer;

  const MyConversations({this.drawer});
  @override
  _MyConversationsState createState() => _MyConversationsState();
}

class _MyConversationsState extends State<MyConversations> {
  bool deletionMode = false;
  HashMap<String, bool> chatsToDelete = new HashMap();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      "",
      "Minhas Conversas",
      _getMyConversations(),
      widget.drawer,
      actions: deletionMode
          ? [
              IconButton(
                onPressed: _deleteAllSelectedChats,
                icon: const Icon(Icons.delete_outline),
                color: Colors.red,
              ),
            ]
          : null,
    );
  }

  Widget _getMyConversations() {
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: FutureBuilder(
        future: _getUserChats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  chat_id: snapshot.data[index]["chat_id"].toString(),
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username: 'Rorgérin Júrnio',
                  longPressHandler: _toggleDeleteMode,
                  isIndeletionMode: deletionMode,
                  toggleChatToDelete: _toggleChatToDelete,
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _deleteAllSelectedChats() {
    print('Deletando todos...');
  }

  void _toggleDeleteMode() {
    setState(() {
      deletionMode = !deletionMode;
    });
  }

  void _toggleChatToDelete(String chat_id) {
    if (chatsToDelete[chat_id] != null)
      chatsToDelete[chat_id] = true;
    else if (chatsToDelete[chat_id] != null)
      chatsToDelete[chat_id] = !chatsToDelete[chat_id];

    // setState(() {
    //   chatsToDelete[chat_id] = !chatsToDelete[chat_id];
    // });

    print(chatsToDelete);
  }

  Future<dynamic> _getUserChats() async {
    var params = {"user_id": "1"};

    Uri uri = Uri.parse("https://pax-chat.herokuapp.com/chats");
    final newURI = uri.replace(queryParameters: params);

    var response = await http.get(newURI);
    var jsonData = json.decode(response.body);

    final List<dynamic> chats = [];
    for (var item in jsonData) {
      chats.add(item);
    }

    return chats;
  }
}
