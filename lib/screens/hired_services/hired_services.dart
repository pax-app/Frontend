import 'package:Pax/components/user_pax_card/user_pax_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HiredServices extends StatefulWidget {
  @override
  _HiredServicesState createState() => _HiredServicesState();
}

class _HiredServicesState extends State<HiredServices> {
  final Firestore _firestore = Firestore.instance;

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
        'provider_id': 'Pedro da Silva'
      },
      statusProvider: 'started',
      statusUser: 'pending',
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

  Future<dynamic> _getAllUserPax() async {
    var res = await http.get('https://pax-chat.herokuapp.com/hour');
    var body = json.decode(res.body);

    var allPax = await _firestore
        .collection('pax')
        .where('user_id', isEqualTo: 1)
        .getDocuments()
        .then((snapshot) {
      print(snapshot.documents);
    });

    return allPax;
  }
}
