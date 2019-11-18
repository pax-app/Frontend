import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/provider_pax_card/provider_pax_card.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:Pax/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderPaxScreen extends StatefulWidget {
  final String title;

  const ProviderPaxScreen({
    @required this.title,
  });

  @override
  _ProviderPaxScreenState createState() => _ProviderPaxScreenState();
}

class _ProviderPaxScreenState extends State<ProviderPaxScreen> {
  var allPax = [];
  bool isLoading = true;
  final Firestore _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    _getAllPaxBasedOnType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        'Meus Serviços ${widget.title}s',
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * .77,
          child: ListView.builder(
            itemCount: allPax.length,
            itemBuilder: (context, index) {
              return ProviderPaxCard(
                pax: allPax[index],
                onCancelHandler: _cancelPax,
                onTapButtonHandler: _initiatePax,
                statusUser: 'pending',
              );
            },
          ),
        ),
      ),
    );
  }

  void _getAllPaxBasedOnType() async {
    final Map<String, String> paxRoute = {
      "Pendente": "pendent_pax",
      "Iniciado": "initiated_pax",
      "Finalizado": "finalized_pax",
      "Cancelado": "canceled_pax",
    };
    var res = await http.get(
        'https://pax-pax.herokuapp.com/pax/${paxRoute[widget.title]}/provider/${LoggedUser().providerId}');

    var data = json.decode(res.body)['data']['pax'];

    var paxs = [];

    for (var item in data) {
      var user_info = await _getUserInfo(item);
      var rtStatus = await _getPaxStatus(item['pax_id']);
      var userAddress = await _getUserAddress(item['address_id']);

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
        'address_id': userAddress['address_id'],
        'street': userAddress['street'],
        'neighborhood': userAddress['neighborhood'],
        'number': userAddress['number'],
        'complement': userAddress['complement'],
        'city': userAddress['city'],
        'cep': userAddress['cep'],
        'state': userAddress['state'],
        'reference_point': userAddress['reference_point'],
      });
    }

    print(data);

    setState(() {
      allPax = data;
      isLoading = false;
    });
  }

  void _initiatePax() async {}

  void _cancelPax() async {}

  Future<dynamic> _getUserInfo(var item) async {
    var url =
        'https://pax-user.herokuapp.com/get_user_info/provider/${item['provider_id']}';
    var user_info = await http.get(url);

    return json.decode(user_info.body);
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

  Future<dynamic> _getUserAddress(int addressId) async {
    var response = await http.get(
        'https://pax-user.herokuapp.com/get_address/${addressId.toString()}');
    var jsonData = json.decode(response.body);

    print(jsonData);

    return jsonData;
  }
}
