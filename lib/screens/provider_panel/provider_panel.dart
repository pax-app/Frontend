import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/chat_tile/chat_tile.dart';
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
      appBar: WhiteAppBar('Painel do Prestador', context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    'Meus Serviços',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Center(
                  child: Container(
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
                ),
                Divider(height: 60, color: Color.fromRGBO(0, 0, 0, .2)),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text(
                    'Minhas Mensagens Recentes',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ChatTile(
                        chatId: null,
                        username: 'Roger',
                        message: 'Fala mané!',
                      ),
                      ChatTile(
                        chatId: null,
                        username: 'Dutra',
                        message: 'Mexam na Planilha do ZenHub!',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
