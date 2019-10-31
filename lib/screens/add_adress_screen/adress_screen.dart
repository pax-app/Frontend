import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/screens/add_adress_screen/cep_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/via_cep.dart';

class AdressScreen extends StatefulWidget {
  final String userCep;
  final String localidade;
  const AdressScreen({Key key, this.userCep, this.localidade})
      : super(key: key);
  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  String userCep;
  _AdressScreenState({this.userCep});
  Future<String> gatinhoSalsicha() async {
    return await getCepData("72025650");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getCepData("72025650"),
      builder: (context, snapshot) {
        TextEditingController _cep = TextEditingController(text: snapshot.data);
        if (snapshot.hasData) {
          return TextInput(
            'Logradouro',
            'Insira uma descrição sobre você',
            true,
            (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
            TextInputType.text,
            1,
            focus: true,
            controller: _cep,
            enabled: true,
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Future<String> getCepData(String cep) async {
    var CEP = via_cep();

    var result = await CEP.searchCEP('$cep', 'json', '');
    String resultado = CEP.getLocalidade();
    return resultado;
  }
}
