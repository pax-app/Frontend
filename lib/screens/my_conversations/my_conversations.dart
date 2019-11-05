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
  bool _deletionMode = false;
  List<int> _chatsToDelete = [];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      "",
      "Minhas Conversas",
      _getMyConversations(),
      widget.drawer,
      actions: _deletionMode
          ? [
              FlatButton(
                onPressed: () {},
                textColor: Colors.black,
                child: Text(
                  "DELETAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              )
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
                int chat_id = snapshot.data[index]["chat_id"];
                return ChatTile(
                  chat_id: chat_id,
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username: 'Rorgérin Júrnio',
                  isInDeletionMode: _deletionMode,
                  isChatSelected:
                      _chatsToDelete.contains(chat_id) ? true : false,
                  longPressHandler: _startDeletionMode,
                  updateChatsToBeDeleted: _updateChatsToBeDeleted,
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

  void _startDeletionMode(int chat_id) {
    if (_deletionMode == false) {
      setState(() {
        _deletionMode = true;
      });
      _updateChatsToBeDeleted(chat_id);
    }
  }

  void _updateChatsToBeDeleted(int chat_id) {
    if (_chatsToDelete.contains(chat_id) == false) {
      setState(() {
        _chatsToDelete.add(chat_id);
      });
    } else {
      setState(() {
        _chatsToDelete.remove(chat_id);
      });
    }
    if (_chatsToDelete.isEmpty) {
      setState(() {
        _deletionMode = false;
      });
    }
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
