import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/category_screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer.dart';
import 'package:Pax/screens/home_screen/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        //Exemplo de como deve chamar a tela no drawer
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Exemplo",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          ),
          drawer: CustomDrawer(_pageController),
          body: BaseScreen('Hellouuu!!', exemplo()),
        ),
        //Tela de Selecionar categorias
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Categorias",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          ),
          drawer: CustomDrawer(_pageController),
          body: BaseScreen('Quais categorias você se encaixa?', CategoryScreen()),
        ),
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
