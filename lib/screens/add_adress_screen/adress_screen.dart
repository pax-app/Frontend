import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';
import 'package:Pax/models/Address.dart';

import '../../models/Address.dart';

class AdressScreen extends StatefulWidget {
  final String userCep;
  const AdressScreen({this.userCep});

  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  final _city = TextEditingController();
  final _street = TextEditingController();
  final _neighborhood = TextEditingController();
  final _state = TextEditingController();
  final _number = TextEditingController();
  final _complement = TextEditingController();
  final _referencePoint = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar('Adicionar Endereço', context),
      body: FutureBuilder(
        future: _getCepData(widget.userCep),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              height: MediaQuery.of(context).size.height - 250,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            _updateTextInputs(snapshot.data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextInput(
                  'Rua',
                  'Insira sua rua',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _street,
                  enabled: false,
                ),
                TextInput(
                  'Bairro',
                  'Insira seu bairro',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _neighborhood,
                  enabled: false,
                ),
                TextInput(
                  'Cidade',
                  'Insira sua cidade',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _city,
                  enabled: false,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: TextInput(
                          'Estado',
                          'Insira seu estado',
                          true,
                          (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
                          TextInputType.text,
                          1,
                          focus: true,
                          controller: _state,
                          enabled: false,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                        height: 50.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: TextInput(
                          'Número',
                          'Insira o número da residência',
                          true,
                          (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
                          TextInputType.text,
                          1,
                          focus: true,
                          controller: _number,
                          enabled: true,
                        ),
                      )
                    ],
                  ),
                ),
                TextInput(
                  'Complemento',
                  'Adicione um complemento',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _complement,
                  enabled: true,
                ),
                TextInput(
                  'Ponto de referência',
                  'Ajude a te encontrar com mais facilidade',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _referencePoint,
                  enabled: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Button(
                  buttonText: 'Vamos lá',
                  type: 'default',
                  tapHandler: () async {},
                  isSmall: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<dynamic> _getCepData(String cep) async {
    var CEP = via_cep();

    await CEP.searchCEP('$cep', 'json', '');

    print(CEP.getBody());
    var automated_address = {
      'cep': CEP.getCEP(),
      'street': CEP.getLogradouro(),
      'neighborhood': CEP.getBairro(),
      'city': CEP.getLocalidade(),
      'state': CEP.getUF(),
    };

    return automated_address;
  }

  void _updateTextInputs(var data) {
    print(data);
    _city.text = data['city'];
    _street.text = data['street'];
    _neighborhood.text = data['neighborhood'];
    _state.text = data['state'];
  }
}
