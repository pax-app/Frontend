import 'package:flutter/material.dart';

class PaxBubble extends StatelessWidget {
  final String paxTitle;
  final String paxStatus;

  PaxBubble({
    @required this.paxTitle,
    @required this.paxStatus,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
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
            paxStatus == 'refused'
                ? 'Pax recusado'
                : 'Clique para visualizar...',
            style: Theme.of(context).textTheme.subtitle,
          )
        ],
      ),
    );
  }
}
