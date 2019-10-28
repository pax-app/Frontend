import 'package:Pax/components/avaliation_card/avaliation_card.dart';
import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:Pax/models/avaliation.dart';
import 'package:Pax/models/user.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  List<Avaliation> avaliations = List<Avaliation>();
  PerfilScreen() {
    for (var i = 0; i < 5; i++) {
      Avaliation a = Avaliation(
        date: "24/07/2018",
        description: "Umas descricao",
        user: User(name: "Esio"),
        score: 5,
      );
      avaliations.add(a);
      debugPrint(avaliations.length.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nome",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Carisma"),
                  StarsAvaliation(2, context)
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Avaliação dos contratados",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text("${avaliations.length} Avaliações")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: avaliations
                    .map((avaliation) => AvaliationCard(avaliation))
                    .toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
