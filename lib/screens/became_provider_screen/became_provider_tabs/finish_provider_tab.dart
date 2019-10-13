import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';

class FinishProviderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Nossa equipe está analisando seu perfil'),
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/illustrations/finish-provider.png', width: 500),
          SizedBox(
            height: 50,
          ),
          Text(
              "Fique atento a sua caixa de entrada, enviaremos um email com os detalhes"),
          SizedBox(
            height: 70,
          ),
          Button(
            buttonText: 'Perfeito',
            type: 'default',
            tapHandler: () {},
            isSmall: false,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
