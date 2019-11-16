import 'package:Pax/components/dummies_loaders/dummy_content.dart';
import 'package:flutter/material.dart';

class DummyUserPaxCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 3),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 270,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 2),
              child: DummyContent(width: 180, height: 30),
            ),
            Divider(
              height: 0,
              thickness: 1.1,
              color: Color.fromRGBO(0, 0, 0, .15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 14,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DummyContent(width: 90, height: 15),
                          SizedBox(
                            height: 3,
                          ),
                          DummyContent(width: 70, height: 15),
                        ],
                      ),
                      DummyContent(width: 98, height: 26)
                    ],
                  ),
                  SizedBox(height: 18),
                  DummyContent(width: 280, height: 18),
                  SizedBox(height: 3),
                  DummyContent(width: 280, height: 18),
                  SizedBox(height: 3),
                  DummyContent(width: 280, height: 18),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DummyContent(width: 80, height: 25),
                      DummyContent(width: 80, height: 25),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
