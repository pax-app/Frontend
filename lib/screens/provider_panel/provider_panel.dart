import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/drawer/drawer.dart';
import 'package:flutter/material.dart';

class ProviderPanel extends StatelessWidget {
  final PageController _pageController;
  ProviderPanel(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(this._pageController),
      appBar: WhiteAppBar('Painel do Prestador'),
    );
  }
}
