import 'package:flutter/material.dart';


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
                
              ],
          ),
        ],
      ),
    );
  }
}