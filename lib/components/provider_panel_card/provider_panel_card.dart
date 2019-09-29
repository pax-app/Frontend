import 'package:flutter/material.dart';

class ProviderPanelCard extends StatelessWidget {
  final bool removeMargin;
  ProviderPanelCard({this.removeMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 200, vertical: 50),
      width: 190,
      margin: EdgeInsets.symmetric(horizontal: removeMargin ? 0 : 36),
      child: Card(
        elevation: CardTheme.of(context).elevation,
        color: CardTheme.of(context).color,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: Text('oi'),
      ),
    );
  }
}
