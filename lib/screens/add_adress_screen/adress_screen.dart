import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';
import 'package:Pax/models/Address.dart';

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
    String cep_n = CEP.getCEP();
    String localidade = CEP.getLocalidade();
    String logradouro = CEP.getLogradouro();
    String bairro = CEP.getBairro();
    String uf = CEP.getUF();

    var resultado = Address(
        address_id: 0,
        city: localidade,
        street: logradouro,
        neighborhood: bairro,
        state: uf,
        number: 0,
        complement: '',
        cep: int.parse(cep_n),
        reference_point: '');

    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Address>(
      future: getCepData(userCep),
      builder: (context, snapshot) {
        TextEditingController _cep =
            TextEditingController(text: snapshot?.data?.cep.toString());
        TextEditingController _city =
            TextEditingController(text: snapshot?.data?.city);
        TextEditingController _street =
            TextEditingController(text: snapshot?.data?.street);
        TextEditingController _neighborhood =
            TextEditingController(text: snapshot?.data?.neighborhood);
        TextEditingController _state =
            TextEditingController(text: snapshot?.data?.state);
        TextEditingController _number =
            TextEditingController(text: snapshot?.data?.number.toString());
        TextEditingController _complement =
            TextEditingController(text: snapshot?.data?.complement);
        TextEditingController _reference_point =
            TextEditingController(text: snapshot?.data?.reference_point);

        if (snapshot.data == null) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              TextInput(
                'CEP',
                'Insira seu cep',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
                TextInputType.text,
                1,
                focus: true,
                controller: _cep,
                enabled: true,
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
                enabled: true,
              ),
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
                enabled: true,
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
                enabled: true,
              ),
              TextInput(
                'Estado',
                'Insira seu estado',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
                TextInputType.text,
                1,
                focus: true,
                controller: _state,
                enabled: true,
              ),
              TextInput(
                'Número',
                'Insira o número da residência',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
                TextInputType.text,
                1,
                focus: true,
                controller: _number,
                enabled: true,
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
                controller: _reference_point,
                enabled: true,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return CircularProgressIndicator();
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
