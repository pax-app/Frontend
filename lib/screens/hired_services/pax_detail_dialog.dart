import 'package:Pax/components/base_dialog/base_dialog.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/stars_avaliation/stars_avaliation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaxDetailDialog extends StatelessWidget {
  final String providerName;
  final String providerPhoto;

  final DateFormat dateFormat = DateFormat("dd/MM/yyyy", "pt-BR");

  var pax;

  PaxDetailDialog({this.pax, this.providerName, this.providerPhoto});
  bool isCancelled() {
    return pax['status'] == 'C';
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: 425,
      body: Column(
        children: <Widget>[
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.3, color: Colors.white),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(providerPhoto),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      providerName,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      dateFormat.format(DateTime.parse(pax['date'])),
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: <Widget>[
                if (!isCancelled())
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Qualidade do Serviço',
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(height: 5),
                      StarsAvaliation(4.5, context),
                    ],
                  ),
                if (!isCancelled()) SizedBox(height: 18),
                if (!isCancelled())
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sobre o prestador',
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(height: 5),
                      StarsAvaliation(0, context),
                    ],
                  ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Descrição',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 6),
                    Text(
                      pax['description'],
                      textAlign: TextAlign.justify,
                      style: TextStyle(height: 1.5),
                    ),
                  ],
                ),
                if (isCancelled()) SizedBox(height: 23),
                if (isCancelled())
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Justificativa',
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Serviço cancelado devido a um acidente que sofri no trabalho, ficarei sem poder fazer esforço por uma semana',
                        textAlign: TextAlign.justify,
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                if (!isCancelled()) SizedBox(height: 25),
                if (!isCancelled())
                  Button(
                    buttonText: 'Reportar',
                    tapHandler: () {},
                    type: 'danger',
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
