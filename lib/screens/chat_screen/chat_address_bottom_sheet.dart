import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChatAddressBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      sheetBody: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
            ),
            child: Text(
              'Escolha o endereço para o prestador realizar o serviço',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 18),
          Column(children: <Widget>[
            Divider(height: 35, thickness: 1.2),
            Text(
              '72871-066 Rua 66 Número 16 Jardim Céu Azul Quadra 88',
              textAlign: TextAlign.center,
            ),
            Divider(height: 35, thickness: 1.2),
            Text(
              '72871-066 Rua 66 Número 16 Jardim Céu Azul Quadra 88',
              textAlign: TextAlign.center,
            ),
          ]),
        ],
      ),
    );
  }
}
