import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/provider_pax_card/provider_pax_card.dart';
import 'package:flutter/material.dart';

class ProviderPaxScreen extends StatelessWidget {
  final String title;

  const ProviderPaxScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(
        title,
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: ListView(
          children: <Widget>[
            ProviderPaxCard(),
          ],
        ),
      ),
    );
  }
}
