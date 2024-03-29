import 'package:Pax/screens/chat_screen/chat_pax_bottom_sheet.dart';
import 'package:Pax/screens/chat_screen/chat_pax_detail.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/chat/start_chat.dart';
import 'package:Pax/components/chat/chat_app_bar.dart';
import 'package:Pax/components/chat/chat_input.dart';
import 'package:Pax/components/chat/chat_list.dart';
import 'package:Pax/screens/chat_screen/chat_address_bottom_sheet.dart';
import 'package:Pax/screens/chat_screen/chat_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

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
  var addresses;

  bool isProvider = false;
  bool isAddressesLoading = true;
  bool showSnackBars = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
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
              // showSnackBars == true ? SnackBarPage() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _update(context, snapshot) {
    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

    if (snapshot.data.documents.length <= 0) return StartChat();

    return ChatList(
      snapshot: snapshot.data.documents,
      isProvider: isProvider,
      showPaxDetails: _showPaxDetails,
    );
  }

  void _sendMessage(String value, bool isImage, bool isPax) async {
    var res = await http.get('https://pax-chat.herokuapp.com/hour');
    var body = json.decode(res.body);

    var date_time_sent = body['time'].toString();

    var chat_ref = _firestore
        .collection(widget.chatId.toString())
        .document(date_time_sent);

    var document;

    if (isImage) {
      document = {
        'path_image': value,
        'sender': isProvider ? 'P' : 'U',
        'date_time_sent': date_time_sent,
      };
    } else if (isPax) {
      document = {
        'pax_title': value,
        'pax_status': 'pending',
        'sender': isProvider ? 'P' : 'U',
        'date_time_sent': date_time_sent,
      };
    } else {
      document = {
        'text_message': value,
        'sender': isProvider ? 'P' : 'U',
        'date_time_sent': date_time_sent,
      };
    }

    _firestore.runTransaction((transaction) async {
      await transaction.set(chat_ref, document);
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChatBottomSheet(
        isProvider: isProvider,
        cameraHandler: () => _storeImage(context, ImageSource.camera),
        galleryHandler: () => _storeImage(context, ImageSource.gallery),
        addressHandler: () => _getAddress(context),
        paxHandler: () => _pushPaxModal(context),
      ),
    );
  }

  void _pushPaxModal(BuildContext context) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => ChatPaxBottomSheet(
        chatId: widget.chatId,
        providerId: 1,
        userId: 1,
        sendPaxFirebase: _sendMessage,
        isLastPaxPending: _isLastPaxPending,
        isLastPaxAccepted: _isLastPaxAccepted,
      ),
    );
  }

  void _showPaxDetails(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => ChatPaxDetail(
        chatId: widget.chatId,
        refusePax: _refusePax,
        acceptPax: _acceptedPax,
        isProvider: isProvider,
      ),
    );
  }

  Future<dynamic> _findLastPax(String field) async {
    var lastPax = await _firestore
        .collection(widget.chatId.toString())
        .where('pax_status', isEqualTo: field)
        .getDocuments()
        .then((snapshot) {
      return snapshot.documents.isNotEmpty
          ? snapshot.documents[snapshot.documents.length - 1].data
          : [];
    });
    return lastPax;
  }

  void _refusePax() async {
    Navigator.of(context).pop();
    var lastPax = await _findLastPax('pending');

    _firestore
        .collection(widget.chatId.toString())
        .document(lastPax['date_time_sent'])
        .updateData({'pax_status': 'refused'});
  }

  void _acceptedPax() async {
    Navigator.of(context).pop();

    var statusChange = {
      "chat_id": widget.chatId,
      "status": 'P',
    };

    var body = json.encode(statusChange);
    var res = await http.patch(
      'https://pax-pax.herokuapp.com/pax/update_status',
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    var lastPax = await _findLastPax('pending');
    _firestore
        .collection(widget.chatId.toString())
        .document(lastPax['date_time_sent'])
        .updateData({'pax_status': 'accepted'});
  }

  Future<bool> _isLastPaxPending() async {
    var lastPaxRefused = await _findLastPax('pending');
    return lastPaxRefused.length > 0 &&
            lastPaxRefused['pax_status'] == 'pending'
        ? true
        : false;
  }

  Future<bool> _isLastPaxAccepted() async {
    var lastPaxAccepeted = await _findLastPax('accepted');
    return lastPaxAccepeted.length > 0 &&
            lastPaxAccepeted['pax_status'] == 'accepted'
        ? true
        : false;
  }

  Future _storeImage(BuildContext context, ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source, imageQuality: 36);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    Navigator.of(context).pop();
    await uploadTask.onComplete;

    storageReference.getDownloadURL().then((fileURL) {
      _sendMessage(fileURL, true, false);
    });
  }

  void _getAddress(BuildContext context) async {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: context,
      builder: (context) => ChatAddressBottomSheet(
        scaffoldKey: _scaffoldKey,
        userId: 1,
        chatId: widget.chatId,
        sendMessage: _sendMessage,
      ),
    );
  }
}
