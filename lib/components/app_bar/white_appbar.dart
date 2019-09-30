import 'package:flutter/material.dart';

class WhiteAppBar extends AppBar {
  WhiteAppBar(String title, context)
      : super(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        );
}
