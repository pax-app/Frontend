import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:Pax/components/base_title_description/base_title_description.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPaxDetail extends StatefulWidget {
  final int chatId;
  final Function refusePax;
  final Function acceptPax;
  final bool isProvider;

  const ChatPaxDetail({
    this.chatId,
    this.refusePax,
    this.acceptPax,
    this.isProvider,
  });

  @override
  _ChatPaxDetailState createState() => _ChatPaxDetailState();
}

class _ChatPaxDetailState extends State<ChatPaxDetail> {
  var pax;
  var address;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPax();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      modalHeight: MediaQuery.of(context).size.height *
          (widget.isProvider && !isLoading ? .6 : isLoading ? .25 : .7),
      sheetBody: pax != null && address != null
          ? Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    pax['name'],
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.052),
                BaseTitleDescription(
                  title: 'Descrição',
                  description: pax['description'],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                BaseTitleDescription(
                  title: 'Endereço',
                  description:
                      '${address['street']} Número ${address['number'].toString()}, ${address['complement'] != null ? address['complement'] + ', ' : ''} ${address['neighborhood']} - CEP: ${address['cep'].toString()} ${address['reference_point'] != null ? '\nPonto de referência: ' + address['reference_point'] : ''}',
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Data: ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text('20/11/1999'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Preço: ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text('R\$ 200,00'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                if (!widget.isProvider)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(
                        buttonText: 'Rejeitar',
                        tapHandler: widget.refusePax,
                        isSmall: true,
                        type: 'danger',
                      ),
                      Button(
                        buttonText: 'Aceitar',
                        tapHandler: widget.acceptPax,
                        isSmall: true,
                      )
                    ],
                  )
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void _initPax() async {
    var res = await http
        .get('https://pax-pax.herokuapp.com/pax/consult_pax/${widget.chatId}');
    var paxJson = json.decode(res.body);

    setState(() {
      pax = paxJson['pax'];
    });
    await _getAddress();
  }

  Future _getAddress() async {
    var res = await http
        .get('https://pax-user.herokuapp.com/get_address/${pax['address_id']}');
    var addressJson = json.decode(res.body);

    setState(() {
      address = addressJson;
      isLoading = false;
    });
  }
}
