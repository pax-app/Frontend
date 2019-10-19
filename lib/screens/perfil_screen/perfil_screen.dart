import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Row(
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
      ],
    );
  }
}
