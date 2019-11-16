import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/red_bubble/red_bubble.dart';
import 'package:Pax/screens/hired_services/pax_detail_dialog.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class UserPaxCard extends StatefulWidget {
  final Function onTapHandler;
  final String statusProvider;
  final String statusUser;

  final String providerName;
  final String providerPhoto;

  var pax;

  UserPaxCard({
    this.pax,
    this.statusUser,
    this.statusProvider,
    this.onTapHandler,
    this.providerName,
    this.providerPhoto,
  });

  @override
  _UserPaxCardState createState() => _UserPaxCardState();
}

class _UserPaxCardState extends State<UserPaxCard> {
  final Map<String, Color> getColor = {
    'P': orangeWarning,
    'I': secondaryColor,
    'F': Colors.teal,
    'C': errorColor,
  };

  final Map<String, String> getText = {
    'P': 'PENDENTE',
    'I': 'INICIADO',
    'F': 'FINALIZADO',
    'C': 'CANCELADO',
  };

  bool isLoading = false;

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
                    widget.pax['name'],
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
                              Text(widget.providerName),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                widget.pax['date'],
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
                            width: widget.pax['status'] == 'F' ||
                                    widget.pax['status'] == 'C'
                                ? 98
                                : 90,
                            decoration: BoxDecoration(
                              color: getColor[widget.pax['status']],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              getText[widget.pax['status']],
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
                              onTap: () => _showDetailDialog(context),
                              child: Text(
                                'DETALHES',
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                        color: getColor[widget.pax['status']]),
                              ),
                            ),
                          )
                        ],
                      ),
                      if (_canShowButton()) SizedBox(height: 30),
                      if (_canShowButton())
                        Button(
                          isLoading: isLoading,
                          tapHandler: _updateStatus,
                          buttonText: widget.pax['status'] == 'P'
                              ? 'CONFIRMAR INÍCIO'
                              : 'FINALIZAR',
                          type: widget.pax['status'] == 'P'
                              ? 'warning'
                              : 'outline',
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (widget.pax['status'] != 'C')
          RedBubble(
            content: 'X',
            onTapHandler: () =>
                widget.onTapHandler(status: 'C', chatId: widget.pax['chat_id']),
          ),
      ],
    );
  }

  void _updateStatus() async {
    setState(() {
      isLoading = true;
    });

    await widget.onTapHandler(
        widget.pax['status'] == 'P' ? 'I' : 'F', widget.pax['chat_id']);

    setState(() {
      isLoading = false;
    });
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => PaxDetailDialog(
        pax: widget.pax,
        providerName: widget.providerName,
        providerPhoto: widget.providerPhoto,
      ),
    );
  }

  bool _canShowButton() {
    return widget.onTapHandler != null &&
        ((widget.pax['status'] == 'P' &&
                widget.statusProvider == 'initiated') ||
            (widget.pax['status'] == 'I' &&
                widget.statusProvider == 'initiated'));
  }
}
