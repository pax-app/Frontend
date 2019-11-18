import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/provider_pax_card/provider_pax_card.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:Pax/theme/colors.dart';
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
        child: ListView(
          children: <Widget>[
            ProviderPaxCard(
              pax: allPax[0],
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

    var allPax = json.decode(res.body)['data']['pax'];

    setState(() {
      allPax = allPax;
      isLoading = false;
    });
  }

  void _initiatePax() async {}

  void _cancelPax() async {}
}
