import 'package:Pax/components/dummies_loaders/dummy_user_pax_card.dart';
import 'package:Pax/components/user_pax_card/user_pax_card.dart';
import 'package:Pax/services/loggedUser.dart';
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
  var isLoading = true;
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
                  providerName: pax[index]['username'],
                  providerPhoto: pax[index]['url_avatar'],
                  statusProvider: pax[index]['provider_status'],
                  statusUser: pax[index]['user_status'],
                  onTapHandler: _changeStatusPax,
                  refreshAllPax: _getAllUserPax,
                );
              },
            ),
    );
  }

  void _changeStatusPax(
      String newStatus, int chatId, int paxId, String type) async {
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

    _firestore
        .collection('pax')
        .document(paxId.toString())
        .updateData({'user_status': type});

    await _getAllUserPax();
  }

  Future<dynamic> _getAllUserPax() async {
    var res = await http.get(
        'https://pax-pax.herokuapp.com/pax/all_pax/${LoggedUser().userId.toString()}');

    final List<Map<String, dynamic>> paxs = [];

    var paxjson = json.decode(res.body);

    for (var item in paxjson) {
      var user_info = await _getUserInfo(item);
      var rtStatus = await _getPaxStatus(item['pax_id']);

      paxs.add({
        'address_id': item['address_id'],
        'canceled_motive': item['canceled_motive'],
        'chat_id': item['chat_id'],
        'date': item['date'],
        'description': item['description'],
        'name': item['name'],
        'pax_id': item['pax_id'],
        'price': item['price'],
        'provider_id': item['provider_id'],
        'status': item['status'],
        'user_id': item['user_id'],
        'username': user_info['username'],
        'url_avatar': user_info['url_avatar'],
        'user_status': rtStatus['user_status'],
        'provider_status': rtStatus['provider_status'],
      });
    }

    print(paxjson);

    setState(() {
      pax = paxs;
      isLoading = false;
    });
  }

  Future<dynamic> _getPaxStatus(int pax_id) async {
    var pax = await _firestore
        .collection('pax')
        .where('pax_id', isEqualTo: pax_id.toString())
        .getDocuments()
        .then((snapshot) {
      return snapshot.documents[0].data;
    });
    return pax;
  }

  Future<dynamic> _getUserInfo(var item) async {
    var url =
        'https://pax-user.herokuapp.com/get_user_info/provider/${item['provider_id']}';
    var user_info = await http.get(url);

    return json.decode(user_info.body);
  }
}
