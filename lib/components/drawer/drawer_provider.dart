import 'package:Pax/components/drawer/drawer_head.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_tile.dart';

class DrawerProvider extends StatelessWidget {
  final PageController _pageController;
  DrawerProvider(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(color: Theme.of(context).primaryColorLight),
          ListView(
            children: <Widget>[
              DrawerHead("", "Youssef Muhamad", 2.5, _pageController),
              Column(
                children: <Widget>[
                  DrawerTile(
                    Icons.person_outline,
                    "Meu Perfil",
                    _pageController,
                    1,
                  ),
                  DrawerTile(
                    Icons.account_balance_wallet,
                    "Minha Carteira",
                    _pageController,
                    2,
                  ),
                  DrawerTile(
                    Icons.chat,
                    "Minhas Conversas",
                    _pageController,
                    3,
                  ),
                  DrawerTile(
                    Icons.library_books,
                    "Histórico de Serviços",
                    _pageController,
                    4,
                  ),
                  DrawerTile(
                    Icons.swap_horiz,
                    "Voltar para usuário",
                    _pageController,
                    5,
                  ),
                  DrawerTile(
                    Icons.build,
                    "Configurações",
                    _pageController,
                    6,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
