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

  bool isAccepted() {
    return paxStatus == 'accepted';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.elasticIn,
      height: isRefused() || isAccepted() ? 115 : 110,
      width: isRefused() || isAccepted() ? 255 : 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            isAccepted()
                ? Icons.check
                : isRefused() ? Icons.close : Icons.timer,
            size: 32,
            color: isRefused() || isAccepted()
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
          Text(
            paxTitle,
            style: Theme.of(context).textTheme.title.copyWith(
                color: isRefused() || isAccepted() ? Colors.white : null),
          ),
          Text(
            isRefused()
                ? 'O Pax foi recusado!'
                : isAccepted()
                    ? 'Pax aceito com sucesso!'
                    : 'Clique para visualizar...',
            style: Theme.of(context).textTheme.subtitle.copyWith(
                color: isRefused() || isAccepted() ? Colors.white : null),
          ),
        ],
      ),
    );
  }
}
