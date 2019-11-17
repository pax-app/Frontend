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

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: _isInitiated() || _isPendent() ? 250 : _isCancelled() ? 310 : 405,
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
                if (_isFinalized()) _getQualityReview(context),
                if (_isFinalized()) SizedBox(height: 18),
                if (_isFinalized()) _getProviderReview(context),
                SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
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
                ),
                if (_isCancelled()) SizedBox(height: 23),
                if (_isCancelled()) _getJustification(context),
                if (!_isCancelled()) SizedBox(height: 35),
                if (_isFinalized())
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

  Widget _getQualityReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Qualidade do Serviço',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 5),
        StarsAvaliation(4.5, context),
      ],
    );
  }

  Widget _getProviderReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Sobre o prestador',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 5),
        StarsAvaliation(0, context),
      ],
    );
  }

  Widget _getJustification(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Justificativa',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 6),
          Text(
            pax['canceled_motive'],
            textAlign: TextAlign.justify,
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }

  bool _isCancelled() {
    return pax['status'] == 'C';
  }

  bool _isFinalized() {
    return pax['status'] == 'F';
  }

  bool _isInitiated() {
    return pax['status'] == 'I';
  }

  bool _isPendent() {
    return pax['status'] == 'P';
  }
}
