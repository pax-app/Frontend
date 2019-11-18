import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/red_bubble/red_bubble.dart';
import 'package:flutter/material.dart';

class ProviderPaxCard extends StatelessWidget {
  final Function onTapButtonHandler;
  final Function onCancelHandler;
  final Function refreshAllPax;
  final String statusUser;
  final dynamic pax;

  ProviderPaxCard({
    @required this.statusUser,
    @required this.pax,
    this.onTapButtonHandler,
    this.onCancelHandler,
    this.refreshAllPax,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 3),
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
                            "Descrição",
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
                            "Endereço",
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
                                "Cliente",
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text("Texto"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Data",
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text("Texto"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Preço",
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text("Texto"),
                            ],
                          )
                        ],
                      ),
                      if (_canShowButton()) SizedBox(height: 40),
                      if (_canShowButton())
                        Button(
                          buttonText: textButton(),
                          tapHandler: onTapButtonHandler,
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        if (_canCancel())
          Positioned(
            top: 10,
            right: 0,
            child: RedBubble(
              content: 'X',
              onTapHandler: onCancelHandler,
            ),
          ),
      ],
    );
  }

  bool _canShowButton() {
    return onTapButtonHandler != null &&
        ((pax['status'] == 'P' && statusUser == 'pending') ||
            (pax['status'] == 'I' && statusUser == 'finalized'));
  }

  bool _canCancel() {
    return pax['status'] != 'F' || pax['status'] != 'C' ? true : false;
  }

  String textButton() {
    return pax['status'] == 'P' ? "INICIAR AGORA" : "VER JUSTIFICATIVA";
  }
}
