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
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();
    _getUserChats();
  }

  Widget build(BuildContext context) {
    return BaseScreen(
      "",
      "Minhas Conversas",
      _getMyConversations(),
      widget.drawer,
      actions: _deletionMode
          ? [
              !isDeleting
                  ? FlatButton(
                      onPressed: _deleteAllSelectedChats,
                      textColor: Colors.black,
                      child: Text(
                        "DELETAR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(9),
                      child: CircularProgressIndicator(),
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
                int chatId = snapshot.data[index]["chat_id"];
                return ChatTile(
                  chatId: chatId.toString(),
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username: 'Rorgérin Júrnio',
                  isInDeletionMode: _deletionMode,
                  isChatSelected:
                      _chatsToDelete.contains(chatId) ? true : false,
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

  void _deleteAllSelectedChats() async {
    setState(() {
      isDeleting = true;
    });

    for (int chat in _chatsToDelete) {
      print(chat);
      await http.delete(
          'https://pax-chat.herokuapp.com/chats?chat_id=${chat.toString()}');
      setState(() {
        _chatsToDelete.remove(chat);
      });
    }

    setState(() {
      isDeleting = false;
    });
  }

  void _startDeletionMode(int chatId) {
    if (_deletionMode == false) {
      setState(() {
        _deletionMode = true;
      });
      _updateChatsToBeDeleted(chatId);
    }
  }

  void _updateChatsToBeDeleted(int chatId) {
    if (_chatsToDelete.contains(chatId) == false) {
      setState(() {
        _chatsToDelete.add(chatId);
      });
    } else {
      setState(() {
        _chatsToDelete.remove(chatId);
      });
    }
    if (_chatsToDelete.isEmpty) {
      setState(() {
        _deletionMode = false;
      });
    }
  }

  Future<dynamic> _getUserChats() async {
    var response =
        await http.get('https://pax-chat.herokuapp.com/chats?user_id=1');
    var jsonData = json.decode(response.body);

    final List<dynamic> chats = [];
    for (var item in jsonData) {
      chats.add(item);
    }

    return chats;
  }
}
