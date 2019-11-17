import 'package:Pax/screens/my_conversations/confirm_deletion_dialog.dart';
import 'package:Pax/components/dummies_loaders/dummy_chat_tile.dart';
import 'package:Pax/screens/my_conversations/chats_is_empty.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:Pax/services/loggedUser.dart';
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
  final nameRegex = RegExp(r'(^[\wÀ-Ÿ]+).* ([\wÀ-Ÿ]+$)');
  bool _deletionMode = false;
  List<int> _chatsToDelete = [];
  bool isDeleting = false;
  LoggedUser loggedUser = LoggedUser();

  @override
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
                      onPressed: () => _confirmDeletion(context),
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
                int chat_id = snapshot.data[index]["chat_id"];
                String name = snapshot.data[index]['username'];
                return ChatTile(
                  chat_id: chat_id,
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username:
                      "${nameRegex.firstMatch(name).group(1)} ${nameRegex.firstMatch(name).group(2)}",
                  isInDeletionMode: _deletionMode,
                  isChatSelected:
                      _chatsToDelete.contains(chat_id) ? true : false,
                  longPressHandler: _startDeletionMode,
                  updateChatsToBeDeleted: _updateChatsToBeDeleted,
                );
              },
            );
          }
          if (snapshot.hasError) return ChatsIsEmpty();
          return ListView(
            children: <Widget>[
              DummyChatTile(),
              DummyChatTile(),
              DummyChatTile(),
            ],
          );
        },
      ),
    );
  }

  void _confirmDeletion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDeletionDialog(
          deleteAllSelectedChats: _deleteAllSelectedChats,
        );
      },
    );
  }

  void _deleteAllSelectedChats() async {
    setState(() {
      isDeleting = true;
    });

    List<int> newChats = [];
    for (int chat in _chatsToDelete) {
      await http.delete(
          'https://pax-chat.herokuapp.com/chats?chat_id=${chat.toString()}');

      newChats.add(chat);
    }

    setState(() {
      isDeleting = false;
      _chatsToDelete = newChats;
      _deletionMode = false;
    });
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
    var response = await http
        .get('https://pax-chat.herokuapp.com/chats/user/${loggedUser.userId}');
    var jsonData = json.decode(response.body);

    final List<Map<String, dynamic>> chats = [];

    for (var item in jsonData) {
      var user_info = await _getUserInfo(item);
      chats.add({
        'chat_id': item['chat_id'],
        'user_id': item['user_id'],
        'provider_id': item['provider_id'],
        'user_address': item['user_address'],
        'username': user_info['username'],
      });
    }
    return chats;
  }

  Future<dynamic> _getUserInfo(var item) async {
    var url =
        'https://pax-user.herokuapp.com/get_user_info/${loggedUser.isProvider == true ? 'user' : 'provider'}/${loggedUser.isProvider ? item['user_id'] : item['provider_id']}';
    var user_info = await http.get(url);

    return json.decode(user_info.body);
  }
}
