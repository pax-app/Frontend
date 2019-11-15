import 'package:flutter/material.dart';

class ZebraTile extends StatelessWidget {
  final String paxName;
  final String username;
  final String date;
  final int money;
  final bool darken;

  ZebraTile({
    @required this.paxName,
    @required this.date,
    @required this.money,
    @required this.username,
    @required this.darken,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
      color: Color.fromRGBO(0, 0, 0, .1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(paxName),
              Text(username),
            ],
          ),
          Column(
            children: <Widget>[
              Text('R\$ $money'),
              Text(date),
            ],
          )
        ],
      ),
    );
  }
}
