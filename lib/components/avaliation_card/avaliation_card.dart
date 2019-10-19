import 'dart:io';

import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:flutter/material.dart';

class AvaliationCard extends StatelessWidget {
  final String name;
  final String date;
  final String description;
  final double score;
  //final File photo;

  AvaliationCard({this.name, this.date, this.description, this.score});

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
                          name,
                          style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 10),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        description,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text("Carisma:"),
                        StarsAvaliation(score, context)
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
