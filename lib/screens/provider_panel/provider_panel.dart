import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:Pax/components/provider_panel_card/provider_panel_card.dart';
import 'package:flutter/material.dart';

class ProviderPanel extends StatelessWidget {
  final PageController _pageController;
  ProviderPanel(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUser(this._pageController),
      appBar: WhiteAppBar('Painel do Prestador'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Meus Serviços',
            style: Theme.of(context).textTheme.title,
          ),
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProviderPanelCard(removeMargin: false),
                ProviderPanelCard(removeMargin: true),
                ProviderPanelCard(removeMargin: false),
              ],
            ),
          ),
          Divider(height: 70, color: Color.fromRGBO(0, 0, 0, .5)),
        ],
      ),
    );
  }
}

// Padding(
//         padding: const EdgeInsets.all(30),
//         child: Text(
//           'Meus Serviços',
//
//         ),
