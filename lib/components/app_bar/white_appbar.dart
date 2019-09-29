import 'package:flutter/material.dart';

class WhiteAppBar extends AppBar {
  WhiteAppBar(String title)
      : super(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        );
}
