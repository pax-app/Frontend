import 'package:Pax/components/drawer/drawer_head.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageController;
  CustomDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(color: Theme.of(context).primaryColorLight),
          ListView(
            children: <Widget>[
              DrawerHead("", "Youssef Muhamad", 2.5),
              Column(
                children: <Widget>[
                  DrawerTile(
                      Icons.person_outline, "Meu Perfil", _pageController, 0),
                  DrawerTile(
                      Icons.credit_card, "Meus Cartões", _pageController, 1),
                  DrawerTile(
                      Icons.chat, "Minhas Conversas", _pageController, 2),
                  DrawerTile(Icons.library_books, "Historico de Serviços",
                      _pageController, 3),
                  DrawerTile(Icons.attach_money, "Virar Prestador de serviço",
                      _pageController, 4),
                  DrawerTile(Icons.build, "Configurações", _pageController, 5),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
