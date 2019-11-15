import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  final LoggedUser _loggedUser = LoggedUser();
  final bool toggleLoggedUser;

  DrawerTile(this.icon, this.text, this.controller, this.page,
      [this.toggleLoggedUser]) {}

  Color colorOfSidebarItem(BuildContext context) {
    return controller.page.round() == page
        ? Theme.of(context).accentColor
        : Colors.white;
  }

  void _toggleProviderMode() {
    _loggedUser.isInProviderDrawer = !_loggedUser.isInProviderDrawer;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Divider(color: const Color.fromRGBO(45, 45, 45, 20), height: 0),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              controller.jumpToPage(page);
              if (this.toggleLoggedUser) {
                _toggleProviderMode();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: <Widget>[
                  Icon(icon, size: 32.0, color: colorOfSidebarItem(context)),
                  SizedBox(width: 24.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                      fontFamily: Theme.of(context).textTheme.title.fontFamily,
                      color: colorOfSidebarItem(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
