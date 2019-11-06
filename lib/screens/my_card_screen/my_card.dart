import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/my_card_screen/add_card.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/base_screen/base_screen.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseScreen('Meus Cartões', 'Meus Cartões', SelectionCard(), null),
    );
  }
}

class SelectionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagePaths = {
      'Master': 'assets/cards_flag/master.png',
      'Visa': 'assets/cards_flag/visa.png'
    };
    return Container(
        child: Column(
      children: <Widget>[
        SimpleTile('584764837635', () {},
            img: imagePaths[cardImageSelector('584764837635')]),
        SizedBox(
          height: MediaQuery.of(context).size.height - 300,
        ),
        Button(
          buttonText: 'Adicionar Cartão',
          type: 'default',
          tapHandler: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BaseScreen(
                  "Cartões",
                  "Meus Cartões",
                  AddCard(),
                  null,
                ),
              ),
            );
          },
          isSmall: false,
        ),
      ],
    ));
  }
}

String cardImageSelector(String cardId) {
  String id;
  id = cardId[0];

  switch (id) {
    case '4':
      return 'Master';
    case '5':
      return 'Visa';
    default:
  }
}
