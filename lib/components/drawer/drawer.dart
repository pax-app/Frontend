import 'package:flutter/material.dart';
import 'package:pax_front_end/components/drawer/drawer_tile.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(color: Colors.black),
          ListView(
            padding: EdgeInsets.only(top: 16.0, left: 32.0),
              children: <Widget>[
                DrawerTile(Icons.people, "Meu Perfil")
              ],
          ),
        ],
      ),
    );
  }
}