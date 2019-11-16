import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/red_bubble/red_bubble.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class UserPaxCard extends StatelessWidget {
  final Function onTapHandler;
  final String statusProvider;
  final String statusUser;

  final Map<String, Color> getColor = {
    'I': secondaryColor,
    'P': orangeWarning,
    'C': errorColor,
    'F': Colors.teal,
  };

  final Map<String, String> getText = {
    'I': 'INICIADO',
    'P': 'PENDENTE',
    'C': 'CANCELADO',
    'F': 'FINALIZADO',
  };

  var pax;

  UserPaxCard({
    this.pax,
    this.statusUser,
    this.statusProvider,
    this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: _canShowButton() ? 300 : 230,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 2),
                  child: Text(
                    pax['name'],
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
                              Text(pax['provider_id']),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                pax['date'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 26,
                            width: 90,
                            decoration: BoxDecoration(
                              color: getColor[pax['status']],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              getText[pax['status']],
                              style:
                                  Theme.of(context).textTheme.subtitle.copyWith(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Montagem de um armário de madeira de 2 metros de altura com 50 parafusos',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'R\$50,00',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Material(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'DETALHES',
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(color: getColor[pax['status']]),
                              ),
                            ),
                          )
                        ],
                      ),
                      if (_canShowButton()) SizedBox(height: 30),
                      if (_canShowButton())
                        Button(
                          tapHandler: () => onTapHandler(
                            pax['status'] == 'P' ? 'I' : 'F',
                            pax['chat_id'],
                          ),
                          buttonText: pax['status'] == 'P'
                              ? 'CONFIRMAR INÍCIO'
                              : 'FINALIZAR',
                          type: pax['status'] == 'P' ? 'warning' : 'outline',
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        RedBubble(
          content: 'X',
          onTapHandler: () => onTapHandler(status: 'C', chatId: pax['chat_id']),
        ),
      ],
    );
  }

  bool _canShowButton() {
    return onTapHandler != null &&
        ((pax['status'] == 'P' && statusProvider == 'started') ||
            (pax['status'] == 'I' && statusProvider == 'started'));
  }
}
