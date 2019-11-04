import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyConversations extends StatefulWidget {
  @override
  _MyConversationsState createState() => _MyConversationsState();
}

class _MyConversationsState extends State<MyConversations> {
  var chats = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserChats();
  }

  @override
  Widget build(BuildContext context) {
    _getUserChats();
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  chatId: chats[index]["chat_id"].toString(),
                  message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
                  username: 'Rorgérin Júrnio',
                );
              },
            ),
    );
  }

  _getUserChats() async {
    var params = {"user_id": "1"};

    Uri uri = Uri.parse("https://pax-chat.herokuapp.com/chats");
    final newURI = uri.replace(queryParameters: params);

    var response = await http.get(newURI);
    var jsonData = json.decode(response.body);

    setState(() {
      chats = jsonData;
      isLoading = false;
    });
  }
}
