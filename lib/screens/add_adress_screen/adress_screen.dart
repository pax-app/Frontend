import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';
import 'package:Pax/models/Address.dart';

import '../../models/Address.dart';

class AdressScreen extends StatefulWidget {
  final String userCep;
  final String localidade;
  const AdressScreen({Key key, this.userCep, this.localidade})
      : super(key: key);
  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  int userCep;
  _AdressScreenState({this.userCep});

  Future<Address> getCepData(int cep) async {
    var CEP = via_cep();

    var result = await CEP.searchCEP('$cep', 'json', '');

    String localidade = CEP.getLocalidade();
    String logradouro = CEP.getLogradouro();
    String bairro = CEP.getBairro();
    String uf = CEP.getUF();

    var resultado = Address(
        address_id: '0',
        city: localidade,
        street: logradouro,
        neighborhood: bairro,
        state: uf,
        number: '',
        complement: '',
        cep: 'cep',
        reference_point: '');

    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Address>(
      future: getCepData(72025650),
      builder: (context, snapshot) {
        TextEditingController _city =
            TextEditingController(text: snapshot?.data?.city);
        TextEditingController _street =
            TextEditingController(text: snapshot?.data?.street);
        TextEditingController _neighborhood =
            TextEditingController(text: snapshot?.data?.neighborhood);
        TextEditingController _state =
            TextEditingController(text: snapshot?.data?.state);
        TextEditingController _number =
            TextEditingController(text: snapshot?.data?.number);
        TextEditingController _complement =
            TextEditingController(text: snapshot?.data?.complement);
        TextEditingController _referencePoint =
            TextEditingController(text: snapshot?.data?.reference_point);

        if (snapshot.data == null) {
          return Container(
            height: MediaQuery.of(context).size.height - 250,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextInput(
                'Rua',
                'Insira sua rua',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
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
                  return value.contains('@') ? 'Do not use the @ char.' : null;
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
                  return value.contains('@') ? 'Do not use the @ char.' : null;
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
                  return value.contains('@') ? 'Do not use the @ char.' : null;
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
                  return value.contains('@') ? 'Do not use the @ char.' : null;
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
    );
  }
}
