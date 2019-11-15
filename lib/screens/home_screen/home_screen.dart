import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/drawer/drawer.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/config_screen/config_screen.dart';
import 'package:Pax/screens/hired_services/hired_services.dart';
import 'package:Pax/screens/my_card_screen/selection_card.dart';
import 'package:Pax/screens/my_wallet_screen/my_wallet_screen.dart';
import 'package:Pax/screens/perfil_screen/perfil_screen.dart';
import 'package:Pax/screens/my_conversations/my_conversations.dart';
import 'package:Pax/screens/provider_panel/provider_panel.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';
import 'package:Pax/screens/general_categories_screen/services_general_categories.dart';

import '../../components/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  final LoggedUser loggedUser = LoggedUser();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: this._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        BaseScreen(
          "Opções de Serviço", //serviço Category deve estar rodando
          "",
          ServiceGeneralCategory(),
          PaxDrawer(_pageController),
        ),
        BaseScreen(
          "Meu Perfil",
          "Meu Perfil",
          PerfilScreen(),
          PaxDrawer(_pageController),
          padding: false,
          white_bg: true,
        ),
        BaseScreen(
          "Cartões",
          "Meus Cartões",
          SelectionCard(),
          PaxDrawer(_pageController),
        ),
        MyConversations(
          drawer: PaxDrawer(_pageController),
        ),
        BaseScreen(
          "Serviços Contratados",
          "Serviços Contratados",
          HiredServices(),
          PaxDrawer(_pageController),
        ),
        BaseScreen(
          " ",
          "Torne-se um prestador ",
          InfoTab(),
          PaxDrawer(_pageController),
        ),
        BaseScreen(
          "Configurações",
          "Edite suas informações",
          ConfigScreen(),
          PaxDrawer(_pageController),
        ),
        ProviderPanel(this._pageController),
        BaseScreen(
          "Minha Carteira",
          "Seu Saldo",
          MyWallet(),
          PaxDrawer(_pageController),
        ),
      ],
    );
  }
}
