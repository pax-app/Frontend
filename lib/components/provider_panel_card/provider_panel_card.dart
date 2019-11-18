import 'package:flutter/material.dart';

class ProviderPanelCard extends StatelessWidget {
  final bool removeMargin;
  final String cardName;
  final String img;
  final Function onTapHandler;

  ProviderPanelCard({
    @required this.removeMargin,
    @required this.cardName,
    @required this.img,
    @required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      margin: EdgeInsets.symmetric(horizontal: removeMargin ? 0 : 25),
      child: Card(
        elevation: CardTheme.of(context).elevation,
        color: CardTheme.of(context).color,
        shape: CardTheme.of(context).shape,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: InkWell(
          onTap: onTapHandler,
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: <Widget>[
              Image.asset(img, width: 166),
              Text(
                this.cardName,
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
