import 'package:flutter/material.dart';

class StarsAvaliation extends StatelessWidget {
  final double avaliationScore;
  final BuildContext context;
  StarsAvaliation(this.avaliationScore, this.context);
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    int qntEl = avaliationScore.toInt();
    for (int i = 1; i <= 5; i++) {
      if (i <= qntEl)
        list.add(IconTheme(
          child: Icon(Icons.star),
          data: IconThemeData(color: Theme.of(context).accentColor),
        ));
      else
        list.add(IconTheme(
          child: Icon(Icons.star_border),
          data: IconThemeData(color: Theme.of(context).accentColor),
        ));
    }

    if ((avaliationScore - qntEl) > 0) {
      list[qntEl.round()] = IconTheme(
        child: Icon(Icons.star_half),
        data: IconThemeData(color: Theme.of(context).accentColor),
      );
    }
    return Row(children: list);
  }
}
