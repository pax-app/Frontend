import 'dart:io';

import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:Pax/models/avaliation.dart';
import 'package:flutter/material.dart';

class AvaliationCard extends StatelessWidget {
  final Avaliation avaliation;

  AvaliationCard(this.avaliation);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //image: DecorationImage(),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 3.0,
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          avaliation.user.name,
                          style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Text(
                          avaliation.date,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 10),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        avaliation.description,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text("Carisma:"),
                        StarsAvaliation(avaliation.score, context)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black45,
          height: 30,
        ),
      ],
    );
  }
}
