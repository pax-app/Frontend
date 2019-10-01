import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Em algumas etapas você estará pronto para prestar seviços:',
          style: Theme.of(context).textTheme.body1,
        ),
        SizedBox(
          height: 30.0,
        ),
        taskItem(1, 'Envie-nos alguns documentos', context),
        taskItem(2, 'Selecione suas áreas de atuação', context),
        taskItem(3, 'Capriche ao preencher seu perfil', context),
        taskItem(4, 'Nossa equipe lhe retornará', context),
        Button(
          buttonText: 'Vamos lá',
          type: 'default',
          tapHandler: () {},
          isSmall: false,
        )
      ],
    );
  }

  Widget taskItem(int number, String description, context) {
    return Row(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 1.0,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text('$description'),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
