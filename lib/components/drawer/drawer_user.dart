import 'package:Pax/components/drawer/drawer_head.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_tile.dart';

class DrawerUser extends StatelessWidget {
  final PageController _pageController;
  final LoggedUser loggedUser = LoggedUser();
  DrawerUser(this._pageController);

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
                  DrawerTile(
                    Icons.person_pin,
                    "Buscar por Serviço",
                    _pageController,
                    0,
                    false,
                  ),
                  DrawerTile(
                    Icons.credit_card,
                    "Meus Cartões",
                    _pageController,
                    2,
                    false,
                  ),
                  DrawerTile(
                    Icons.chat,
                    "Minhas Conversas",
                    _pageController,
                    3,
                    false,
                  ),
                  DrawerTile(
                    Icons.library_books,
                    "Serviços Contratados",
                    _pageController,
                    4,
                    false,
                  ),
                  DrawerTile(
                    this.loggedUser.isProvider
                        ? Icons.swap_horiz
                        : Icons.attach_money,
                    this.loggedUser.isProvider
                        ? "Mudar para Prestador"
                        : "Virar Prestador de Serviço",
                    _pageController,
                    this.loggedUser.isProvider ? 7 : 5,
                    this.loggedUser.isProvider,
                  ),
                  DrawerTile(
                    Icons.settings,
                    "Configurações",
                    _pageController,
                    6,
                    false,
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
