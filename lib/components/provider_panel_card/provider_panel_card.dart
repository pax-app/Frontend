import 'package:flutter/material.dart';

class ProviderPanelCard extends StatelessWidget {
  final bool removeMargin;
  final String cardName;
  final String img;
  ProviderPanelCard({this.removeMargin, this.cardName, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 155,
        margin: EdgeInsets.symmetric(horizontal: removeMargin ? 0 : 36),
        child: Card(
          elevation: CardTheme.of(context).elevation,
          color: CardTheme.of(context).color,
          shape: CardTheme.of(context).shape,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  img,
                  width: 100,
                ),
                Text(
                  this.cardName,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
          ),
        ));
  }
}
