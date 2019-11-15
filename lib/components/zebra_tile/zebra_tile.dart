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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
      decoration: BoxDecoration(
        color: darken ? Color.fromRGBO(0, 0, 0, .07) : null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                paxName,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 6),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '+R\$ $money',
                style: Theme.of(context).textTheme.subtitle.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                username,
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
