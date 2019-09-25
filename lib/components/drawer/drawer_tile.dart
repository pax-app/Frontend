import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
            height: 60.0,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        size: 32.0,
                        color: controller.page.round() == page
                            ? Theme.of(context).accentColor
                            : Colors.white,
                      ),
                      SizedBox(width: 24.0),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: controller.page.round() == page
                              ? Theme.of(context).accentColor
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Divider(
                  color: Color.fromRGBO(45, 45, 45, 20),

                  height: 8,
                )
              ],
            )),
      ),
    );
  }
}
