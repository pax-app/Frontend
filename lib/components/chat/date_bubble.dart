import 'package:flutter/material.dart';

class DateBubble extends StatelessWidget {
  final String date;

  DateBubble({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, .3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        date,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
