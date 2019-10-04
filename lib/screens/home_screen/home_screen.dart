import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/profile_image_tab.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/sign_up_tab.dart';
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
        BaseScreen(
          "Opções de Serviço",
          "",
          exemplo(),
          getDrawer(),
        ),
        BaseScreen(
          "Categorias",
          "Quais categorias você se encaixa?",
          CategoryScreen(),
          getDrawer(),
        ),
        ProviderPanel(this._pageController),
        BaseScreen(
          " ",
          "Torne-se um prestador ",
          InfoTab(),
          getDrawer(),
        ),
        BaseScreen(
          " ",
          "Preencha seus dados abaixo ",
          SignUpTab(),
          getDrawer(),
        ),
        BaseScreen(
          " ",
          "Termine criando seu perfil ",
          ProfileImageTab(),
          getDrawer(),
        ),
      ],
    );
  }
}

Widget exemplo() {
  return Container(
    height: 560,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SimpleTile('services list'),
        SimpleTile('services list'),
        Button(
          buttonText: 'Entrar',
          tapHandler: () {},
          type: 'default',
          isSmall: false,
        ),
        Button(
          buttonText: 'Ficou Boa',
          tapHandler: () {},
          type: 'default',
          isSmall: true,
        ),
        Button(
          buttonText: 'Reportar',
          tapHandler: () {},
          type: 'danger',
          isSmall: false,
        ),
        Button(
          buttonText: 'Small',
          tapHandler: () {},
          type: 'danger',
          isSmall: true,
        ),
        Button(
          buttonText: 'Justificativa',
          tapHandler: () {},
          type: 'outline',
          isSmall: false,
        ),
        Button(
          buttonText: 'a',
          tapHandler: () {},
          type: 'outline',
          isSmall: true,
        ),
      ],
    ),
  );
}
