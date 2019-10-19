import 'package:Pax/components/chat_app_bar/chat_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

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
        onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
