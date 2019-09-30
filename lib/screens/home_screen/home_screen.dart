import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/category_screen/category_screen.dart';
import 'package:Pax/screens/provider_panel/provider_panel.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:Pax/screens/home_screen/tabs/home_tab.dart';

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
        BaseScreen("Opões de Serviço", "", exemplo(), getDrawer()),
        BaseScreen("Categorias", "Quais categorias você se encaixa?",
            CategoryScreen(), getDrawer()),
        ProviderPanel(this._pageController),
      ],
    );
  }
}

Widget exemplo() {
  return Container(
    child: Column(
      children: <Widget>[
        SimpleTile('services list'),
        SimpleTile('services list'),
        Button("default", () {}, "default", false),
        Button("Default small", () {}, "default", true),
        Button("Danger", () {}, "danger", false),
        Button("Danger small", () {}, "danger", true),
        Button("outline", () {}, "outline", false),
        Button("outline small", () {}, "outline", true),
        Button("outline small", () {}, "outline", true),
      ],
    ),
  );
}
