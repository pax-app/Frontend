import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';

class PaxDrawer extends StatelessWidget {
  final PageController _pageController;
  final loggedUser = LoggedUser();
  PaxDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    print(loggedUser.isProvider);
    if (loggedUser.isInProviderDrawer)
      return DrawerProvider(_pageController);
    else
      return DrawerUser(_pageController);
  }
}
