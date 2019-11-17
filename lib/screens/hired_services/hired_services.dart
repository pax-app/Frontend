import 'package:Pax/components/dummies_loaders/dummy_user_pax_card.dart';
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
  var isLoading = false;
  var pax = [];

  @override
  void initState() {
    super.initState();
    _getAllUserPax();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .77,
      child: isLoading
          ? ListView(
              children: <Widget>[DummyUserPaxCard(), DummyUserPaxCard()],
            )
          : ListView.builder(
              itemCount: pax.length,
              itemBuilder: (context, index) {
                return UserPaxCard(
                  pax: pax[index],
                  providerName: 'Pedro da Silva',
                  providerPhoto:
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
                  statusProvider: 'initiated',
                  statusUser: 'pending',
                  onTapHandler: _changeStatusPax,
                  refreshAllPax: _getAllUserPax,
                );
              },
            ),
    );
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

  Future<dynamic> _getAllUserPax() async {
    setState(() {
      isLoading = true;
    });

    var res = await http.get('https://pax-pax.herokuapp.com/pax/all_pax/1');

    setState(() {
      pax = json.decode(res.body);
      isLoading = false;
    });
  }
}
