import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/chat_app_bar/chat_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
        title: ChatAppBar(
          provider_name: "Rogério Júnior",
          provider_qualification: "Assistência Técnica: Notebook",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/illustrations/circle-pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
