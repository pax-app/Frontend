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
              DrawerHeader(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text('Drawer Header'),
              ),
              Column(
                children: <Widget>[
                  DrawerTile(Icons.people, "Meu Perfil", _pageController, 0),
                  DrawerTile(
                      Icons.people, "Minha Carteira", _pageController, 1),
                  DrawerTile(Icons.people, "Meus Chats", _pageController, 2),
                  DrawerTile(Icons.people, "Historico de Serviços",
                      _pageController, 3),
                  DrawerTile(Icons.people, "Virar Prestador de serviço",
                      _pageController, 4),
                  DrawerTile(Icons.people, "Configurações", _pageController, 5),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
