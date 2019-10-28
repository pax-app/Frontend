import 'package:Pax/components/notification_icon/notification_icon.dart';
import 'package:flutter/material.dart';

class ProviderPanelCard extends StatelessWidget {
  final bool removeMargin;
  final String cardName;
  final String img;

  ProviderPanelCard({
    @required this.removeMargin,
    @required this.cardName,
    @required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      margin: EdgeInsets.symmetric(horizontal: removeMargin ? 0 : 25),
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
            overflow: Overflow.visible,
            children: <Widget>[
              Image.asset(img, width: 100),
              Text(this.cardName, style: Theme.of(context).textTheme.title),
              Positioned(
                top: -4,
                left: -6,
                child: NotificationIcon(3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
