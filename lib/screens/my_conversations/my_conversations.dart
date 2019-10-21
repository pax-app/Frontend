import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyConversations extends StatelessWidget {
  _getUserChats() async {
    var params = {"user_id": "1"};

    Uri uri = Uri.parse("https://pax-chat.herokuapp.com/chats");
    final newURI = uri.replace(queryParameters: params);

    var response = await http.get(newURI);

    print('---- status code: ${response.statusCode}');
    var jsonData = json.decode(response.body);

    print('---- slot: ${jsonData}');
  }

  @override
  Widget build(BuildContext context) {
    _getUserChats();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ChatTile(
          message: 'O serviço vai ficar R\$35,00, posso mandar o Pax?',
          username: 'Rorgérin Júrnio',
        ),
        ChatTile(
          message: 'Tenho horário livre só terça que vem',
          username: 'Ersin Fritas',
        ),
        ChatTile(
          message: 'Faço isso em dois tempo',
          username: 'Rucas Drutra',
        )
      ],
    );
  }
}
