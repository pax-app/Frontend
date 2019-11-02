import 'package:flutter/material.dart';

class GeneralCategoriesPanelImg extends StatelessWidget {
  final String img;
  GeneralCategoriesPanelImg(this.img);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Image.asset(img, width: 80),
        ],
      ),
    );
  }
}
