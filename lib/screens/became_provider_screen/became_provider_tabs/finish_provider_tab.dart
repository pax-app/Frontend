import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishProviderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 18),
          Text(
            'Nossa equipe está analisando seu perfil',
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(height: 50),
          Image.asset('assets/illustrations/finish-provider.png', width: 500),
          SizedBox(height: 50),
          Text(
            'Fique atento a sua caixa de entrada, enviaremos um email com os detalhes',
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(
            height: 70,
          ),
          Button(
            buttonText: 'Perfeito',
            type: 'default',
            tapHandler: () => Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            ),
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
