import 'package:Pax/components/drawer/drawer_head.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_tile.dart';

class DrawerProvider extends StatelessWidget {
  final PageController _pageController;
  DrawerProvider(this._pageController);
  final LoggedUser loggedUser = LoggedUser();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(color: Theme.of(context).primaryColorLight),
          ListView(
            children: <Widget>[
              DrawerHead("", loggedUser.name, 2.5, _pageController),
              Column(
                children: <Widget>[
                  DrawerTile(Icons.person_outline, "Meu Perfil",
                      _pageController, 1, false),
                  DrawerTile(Icons.account_balance_wallet, "Minha Carteira",
                      _pageController, 2, false),
                  DrawerTile(Icons.chat, "Minhas Conversas", _pageController, 3,
                      false),
                  DrawerTile(Icons.library_books, "Histórico de Serviços",
                      _pageController, 4, false),
                  DrawerTile(
                    Icons.swap_horiz,
                    "Voltar para usuário",
                    _pageController,
                    0,
                    true,
                  ),
                  DrawerTile(
                      Icons.build, "Configurações", _pageController, 6, false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
