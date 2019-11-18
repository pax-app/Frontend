import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/provider_pax_card/provider_pax_card.dart';
import 'package:Pax/services/loggedUser.dart';
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
  var pax = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getAllPaxBasedOnType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        widget.title,
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: ListView(
          children: <Widget>[
            ProviderPaxCard(
              pax: {},
              onCancelHandler: _cancelPax,
              onTapButtonHandler: _initiatePax,
              statusUser: 'pending',
            ),
            ProviderPaxCard(
              pax: {},
              onCancelHandler: _cancelPax,
              onTapButtonHandler: _initiatePax,
              statusUser: 'pending',
            ),
          ],
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

    setState(() {
      pax = json.decode(res.body);
      isLoading = false;
    });
    print(pax);
  }

  void _initiatePax() async {}

  void _cancelPax() async {}
}
