import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/chat/chat_list.dart';
import 'package:Pax/screens/chat_screen/chat_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;

  final String chat_id;
  final String person_name;

  final bool isProvider = false;

  ChatScreen({
    @required this.chat_id,
    @required this.person_name,
  });

  void _sendMessage(String text) {
    String date_time_sent =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    _firestore.collection(chat_id).document(date_time_sent).setData({
      'text_message': text,
      'sender': isProvider ? 'P' : 'U',
      'date_time_sent': date_time_sent
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatAppBar = ChatAppBar(
      provider_name: "Rogério Júnior",
      provider_qualification: "Assistência Técnica: Notebook",
    );

    final mediaQuery = MediaQuery.of(context);
    final safeBackgroundHeight = mediaQuery.size.height -
        chatAppBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: chatAppBar,
      body: SingleChildScrollView(
        child: Container(
          height: safeBackgroundHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/illustrations/circle-pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: _firestore
                      .collection(chat_id)
                      .orderBy('date_time_sent', descending: true)
                      .snapshots(),
                  builder: _update,
                ),
              ),
              ChatInput(
                sendAction: _sendMessage,
                openBottomSheet: () => _showBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  void _getGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  void _getAddress() async {}

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChatBottomSheet(
        cameraHandler: _getCamera,
        galleryHandler: _getGallery,
        addressHandler: _getAddress,
      ),
    );
  }

  Widget _update(context, snapshot) {
    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

    if (snapshot.data.documents.length <= 0) {
      return Center(
        child: Text(
          'Inicie a conversa :)',
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    return ChatList(
      snapshot: snapshot.data.documents,
      isProvider: isProvider,
    );
  }
}
