import 'package:Pax/components/base_dialog/base_dialog.dart';
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

  void _confirmDeletion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BaseDialog(
          height: 210,
          body: Padding(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Tem certeza que quer deletar?',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20),
                Text('Depois disso não poderá acessar mais estas conversas'),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Não'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {
                        _deleteAllSelectedChats();
                        Navigator.of(context).pop();
                      },
                      textColor: Colors.red,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete_forever),
                          Text('Sim'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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
    var response =
        await http.get('https://pax-chat.herokuapp.com/chats/user/1');
    var jsonData = json.decode(response.body);

    final List<dynamic> chats = [];
    for (var item in jsonData) {
      chats.add(item);
    }

    return chats;
  }
}
