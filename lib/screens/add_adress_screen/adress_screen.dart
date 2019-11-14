import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/disabled_outline_input/disabled_outline_input.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/components/try_again_error/try_again_error.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          child: FutureBuilder(
            future: _getCepData(widget.userCep),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _updateTextInputs(snapshot.data);
                return Padding(
                  padding: const EdgeInsets.only(top: 22, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      DisabledOutlineInput(
                        labelText: 'Rua',
                        textController: _street,
                        lines: 1,
                      ),
                      DisabledOutlineInput(
                        labelText: 'Bairro',
                        textController: _neighborhood,
                        lines: 1,
                      ),
                      DisabledOutlineInput(
                        labelText: 'Cidade',
                        textController: _city,
                        lines: 1,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: DisabledOutlineInput(
                                labelText: 'Estado',
                                textController: _state,
                                lines: 1,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: TextInput(
                                'Número',
                                'Número',
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
                        'Referência para sua residência',
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
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: TryAgainError(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _getCepData(String cep) async {
    var CEP = via_cep();

    await CEP.searchCEP('$cep', 'json', '');

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
    _city.text = data['city'];
    _street.text = data['street'];
    _neighborhood.text = data['neighborhood'];
    _state.text = data['state'];
  }
}
