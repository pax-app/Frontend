import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:Pax/components/provider_panel_card/provider_panel_card.dart';
import 'package:flutter/material.dart';

class ProviderPanel extends StatelessWidget {
  final PageController _pageController;
  ProviderPanel(this._pageController);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagesPaths = {
      'Pendentes': 'assets/illustrations/smudge-green.png',
      'Cancelados': 'assets/illustrations/smudge-purple.png',
      'Finalizados': 'assets/illustrations/smudge-blue.png',
    };
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
            height: 115,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProviderPanelCard(
                  removeMargin: false,
                  cardName: 'Pendentes',
                  img: imagesPaths['Pendentes'],
                ),
                ProviderPanelCard(
                  removeMargin: true,
                  cardName: 'Cancelados',
                  img: imagesPaths['Cancelados'],
                ),
                ProviderPanelCard(
                  removeMargin: false,
                  cardName: 'Finalizados',
                  img: imagesPaths['Finalizados'],
                ),
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
