import 'package:flutter/material.dart';

class PaxBubble extends StatelessWidget {
  final String paxTitle;
  final String paxStatus;

  PaxBubble({
    @required this.paxTitle,
    @required this.paxStatus,
  });

  bool isRefused() {
    return paxStatus == 'refused';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.elasticIn,
      height: isRefused() ? 90 : 80,
      width: isRefused() ? 230 : 225,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            paxTitle,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            isRefused() ? 'O Pax foi recusado!' : 'Clique para visualizar...',
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }
}
