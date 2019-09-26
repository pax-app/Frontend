import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  Color colorOfSidebarItem(BuildContext context) {
    return controller.page.round() == page
        ? Theme.of(context).accentColor
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Divider(color: const Color.fromRGBO(45, 45, 45, 20), height: 8),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              controller.jumpToPage(page);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
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
