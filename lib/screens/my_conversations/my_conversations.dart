import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:flutter/material.dart';

class MyConversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
