import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  BaseScreen(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 30, left: 20, right: 10),
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.title.fontFamily,
                fontSize: Theme.of(context).textTheme.title.fontSize,
                fontWeight: Theme.of(context).textTheme.title.fontWeight,
                color: Theme.of(context).textTheme.title.color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: body,
            ),
          )
        ],
      ),
    );
  }
}
