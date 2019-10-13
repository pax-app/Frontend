import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_screen.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/category_screen/category_screen.dart';
import 'package:Pax/screens/provider_panel/provider_panel.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_user.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  bool isProvider = false;

  Widget getDrawer() {
    return this.isProvider
        ? DrawerProvider(this._pageController)
        : DrawerUser(this._pageController);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: this._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        BaseScreen(
          "Home",
          "Home",
          Text("home"),
          getDrawer(),
        ),
        BaseScreen(
          "Meu Perfil",
          "Meu Perfil",
          Text("Meu Perfil"),
          getDrawer(),
        ),

        BaseScreen(
          "Meus cartoes",
          "Meus cartoes",
          Text("Meus cartoes"),
          getDrawer(),
        ),
        BaseScreen(
          "Minhas Conversas",
          "Minhas Conversas",
          Text("Minhas Conversas"),
          getDrawer(),
        ),
        //roviderPanel(this._pageController),
        BaseScreen(
          "Histórico de Servico",
          "Histórico de Servico",
          Text("Histórico de Servico"),
          getDrawer(),
        ),
        BaseScreen(
          " ",
          "Torne-se um prestador ",
          InfoTab(),
          getDrawer(),
        ),
        BaseScreen(
          "Configurações",
          "Configurações",
          Text("Configurações"),
          getDrawer(),
        ),
      ],
    );
  }
}
