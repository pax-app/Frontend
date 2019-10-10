import 'package:Pax/components/avaliation_card/avaliation_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/config_screen/config_screen.dart';
import 'package:Pax/screens/perfil_screen/perfil_screen.dart';
import 'package:Pax/screens/chat_screen/chat_screen.dart';
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
          // AvaliationCard(
          //   date: "24/07/2018",
          //   description: "Umas descricao",
          //   name: "Esio",
          //   score: 5,
          // ),
          PerfilScreen(),
          getDrawer(),
          padding: false,
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
<<<<<<< HEAD
=======
        ),
        ChatScreen()
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
>>>>>>> pax-app/Wiki#160 Add initial chat screen with the provider data app bar
        ),
        BaseScreen(
          "Configurações",
          "Edite suas informações",
          ConfigScreen(),
          getDrawer(),
        ),
      ],
    );
  }
}
