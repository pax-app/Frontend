import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  String img, name;
  double qntStars;
  PageController controller;

  DrawerHead(this.img, this.name, this.qntStars, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 56,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.jumpToPage(0);
                  },
                  child: Image.asset(
                    'assets/logo/sidebar_logo.png',
                    height: 30,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 130,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //image: DecorationImage(),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      )),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    SizedBox(height: 6),
                    StarsAvaliation(qntStars, context)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
