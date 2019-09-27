import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final String appBarTitle;
  BaseScreen(this.title, this.body, {this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle == Null ? '' : appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.title.fontFamily,
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                  fontWeight: Theme.of(context).textTheme.title.fontWeight,
                  color: Theme.of(context).textTheme.title.color,
                ),
              ),
            ),
            Container(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
