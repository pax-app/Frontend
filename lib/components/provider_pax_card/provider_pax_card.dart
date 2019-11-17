import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';

class ProviderPaxCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 2,
            ),
            child: Text(
              "Título",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Divider(
            height: 0,
            thickness: 1.1,
            color: Color.fromRGBO(0, 0, 0, .15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 25,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Título",
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text("Texto"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Título",
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text("Texto"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Título",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text("Texto"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Título",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text("Texto"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Título",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text("Texto"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Button(
                    buttonText: "INICIAR AGORA",
                    tapHandler: () => {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
