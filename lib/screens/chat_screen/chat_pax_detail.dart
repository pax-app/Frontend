import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:Pax/components/base_title_description/base_title_description.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';

class ChatPaxDetail extends StatelessWidget {
  final int chatId;

  const ChatPaxDetail({this.chatId});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      modalHeight: MediaQuery.of(context).size.height * .71,
      sheetBody: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              'Arrumar a tela do Galaxy S8',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.052),
          BaseTitleDescription(
            title: 'Descrição',
            description:
                'Trocar a tela do Galaxy S8 com o vidro da tela original, sem necessidade de trocar o display pois pelo que foi mostrado, está em boas condições.',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          BaseTitleDescription(
            title: 'Endereço',
            description: '72871-066 Rua 66 Número 16 Jardim Céu Azul Quadra 88',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Button(
                buttonText: 'Rejeitar',
                tapHandler: () {},
                isSmall: true,
                type: 'danger',
              ),
              Button(
                buttonText: 'Aceitar',
                tapHandler: () {},
                isSmall: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
