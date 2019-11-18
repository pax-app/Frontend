import 'package:Pax/components/dummies_loaders/dummy_content.dart';
import 'package:flutter/material.dart';

class DummyProviderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: ClipOval(
                child: DummyContent(
                  height: 73,
                  width: 73,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
