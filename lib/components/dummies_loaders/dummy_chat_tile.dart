import 'package:Pax/components/dummies_loaders/dummy_content.dart';
import 'package:flutter/material.dart';

class DummyChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: Theme.of(context).cardTheme.elevation,
        color: Theme.of(context).cardTheme.color,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: DummyContent(width: 70, height: 70),
              ),
              SizedBox(width: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DummyContent(width: 130, height: 15),
                  SizedBox(height: 14),
                  DummyContent(width: 180, height: 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
