import 'package:flutter/material.dart';

class PaxBubble extends StatelessWidget {
  final String paxTitle;

  const PaxBubble({this.paxTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        width: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              paxTitle,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              'Clique para visualizar...',
              style: Theme.of(context).textTheme.subtitle,
            )
          ],
        ),
      ),
    );
  }
}
