import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/chat_tile/chat_tile.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/components/provider_panel_card/provider_panel_card.dart';
import 'package:Pax/screens/provider_pax_screen/provider_pax_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderPanel extends StatelessWidget {
  final PageController _pageController;
  ProviderPanel(this._pageController);

  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagesPaths = {
      'Pendentes': 'assets/illustrations/marker-orange.png',
      'Iniciados': 'assets/illustrations/marker-green.png',
      'Finalizados': 'assets/illustrations/marker-teal.png',
      'Cancelados': 'assets/illustrations/marker-red.png',
    };

    return Scaffold(
      drawer: DrawerProvider(this._pageController),
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
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ProviderPanelCard(
                              removeMargin: false,
                              cardName: 'Pendentes',
                              img: imagesPaths['Pendentes'],
                              onTapHandler: () =>
                                  _pushToPaxScreen(context, 'Pendente'),
                            ),
                            ProviderPanelCard(
                              removeMargin: true,
                              cardName: 'Iniciados',
                              img: imagesPaths['Iniciados'],
                              onTapHandler: () =>
                                  _pushToPaxScreen(context, 'Iniciado'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            ProviderPanelCard(
                              removeMargin: false,
                              cardName: 'Finalizados',
                              img: imagesPaths['Finalizados'],
                              onTapHandler: () =>
                                  _pushToPaxScreen(context, 'Finalizado'),
                            ),
                            ProviderPanelCard(
                              removeMargin: true,
                              cardName: 'Cancelados',
                              img: imagesPaths['Cancelados'],
                              onTapHandler: () =>
                                  _pushToPaxScreen(context, 'Cancelado'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pushToPaxScreen(BuildContext context, String type) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProviderPaxScreen(
          title: type,
        ),
      ),
    );
  }
}
