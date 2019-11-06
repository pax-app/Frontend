import 'dart:io';

import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/chat/chat_list.dart';
import 'package:Pax/screens/chat_screen/chat_address_bottom_sheet.dart';
import 'package:Pax/screens/chat_screen/chat_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ChatScreen extends StatefulWidget {
  final int chatId;
  final String personName;

  ChatScreen({
    @required this.chatId,
    @required this.personName,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Firestore _firestore = Firestore.instance;

  bool isProvider = false;
  var addresses;
  bool isAddressesLoading = true;

  @override
  Widget build(BuildContext context) {
    final chatAppBar = ChatAppBar(
      providerName: "Rogério Júnior",
      providerQualification: "Assistência Técnica: Notebook",
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
                      .collection(widget.chatId.toString())
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

  void _sendMessage(String value, bool isImage) {
    var dateTimeSent = DateTime.now().millisecondsSinceEpoch.toString();

    var chatRef =
        _firestore.collection(widget.chatId.toString()).document(dateTimeSent);

    _firestore.runTransaction((transaction) async {
      await transaction.set(chatRef, {
        isImage ? 'path_image' : 'text_message': value,
        'sender': isProvider ? 'P' : 'U',
        'date_time_sent': dateTimeSent
      });
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChatBottomSheet(
        cameraHandler: () => _storeImage(context, ImageSource.camera),
        galleryHandler: () => _storeImage(context, ImageSource.gallery),
        addressHandler: () => _getAddress(context),
      ),
    );
  }

  Future _storeImage(BuildContext context, ImageSource source) async {
    Navigator.of(context).pop();
    File image = await ImagePicker.pickImage(source: source, imageQuality: 42);

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;

    storageReference.getDownloadURL().then((fileURL) {
      _sendMessage(fileURL, true);
    });
  }

  void _getAddress(BuildContext context) async {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: context,
      builder: (context) => ChatAddressBottomSheet(userId: 1),
    );
  }
}
