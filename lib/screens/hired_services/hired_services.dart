import 'package:Pax/components/user_pax_card/user_pax_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HiredServices extends StatefulWidget {
  final int userId;

  const HiredServices({this.userId});

  @override
  _HiredServicesState createState() => _HiredServicesState();
}

class _HiredServicesState extends State<HiredServices> {
  final Firestore _firestore = Firestore.instance;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _getAllUserPax();
  }

  @override
  Widget build(BuildContext context) {
    return UserPaxCard(
      pax: {
        'price': 100.50,
        'name': 'Testando o teste em 3, 2, 1',
        'date': '21/09/2019',
        'description':
            'vou testar essas paradas aqui do chat pra ver se tá tudo em ordem morô?',
        'status': 'P',
        'provider_id': 'Pedro da Silva',
        'chat_id': 2,
      },
      statusProvider: 'initiated',
      statusUser: 'pending',
      onTapHandler: _changeStatusPax,
    );
    // return FutureBuilder(
    //   future: _getAllUserPax(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return UserPaxCard(
    //         pax: {
    //           'price': 100.50,
    //           'name': 'Testando o teste em 3, 2, 1',
    //           'date': '2019/09/20',
    //           'description':
    //               'vou testar essas paradas aqui do chat pra ver se tá tudo em ordem morô?',
    //           'status': 'P',
    //         },
    //         statusProvider: 'started',
    //         statusUser: 'pending',
    //       );
    //     }
    //   },
    // );
  }

  void _changeStatusPax(String newStatus, int chatId) async {
    var statusChange = {
      "chat_id": chatId,
      "status": newStatus,
    };

    var body = json.encode(statusChange);
    var res = await http.patch(
      'https://pax-pax.herokuapp.com/pax/update_status',
      headers: {"Content-Type": "application/json"},
      body: body,
    );
  }

  Future<dynamic> _getAllUserPax(String type) async {
    final Map<String, String> url = {
      'P': 'pending',
      'I': 'initiated',
      'F': 'finalized',
      'C': 'canceled',
    };

    var res = await http.get(
        'https://pax-pax.herokuapp.com/pax/${url[type]}/user/${widget.userId}');
    var allPax = json.decode(res.body);

    // var allPax = await _firestore
    //     .collection('pax')
    //     .where('user_id', isEqualTo: 1)
    //     .getDocuments()
    //     .then((snapshot) {
    //   print(snapshot.documents);
    // });

    return allPax;
  }
}
