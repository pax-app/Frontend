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
            title: Text("Exemplo"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.green),
        ),
      ],
    );
  }
}
