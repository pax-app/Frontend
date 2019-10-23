import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/screens/category_screen/category_screen.dart';
import 'package:flutter/cupertino.dart';
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
          height: 60.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            children: <Widget>[
              taskItem(1, 'Envie-nos alguns documentos', context),
              taskItem(2, 'Selecione suas áreas de atuação', context),
              taskItem(3, 'Capriche ao preencher seu perfil', context),
              taskItem(4, 'Nossa equipe lhe retornará', context),
            ],
          ),
        ),
        SizedBox(
          height: 90.0,
        ),
        Button(
          buttonText: 'Vamos lá',
          type: 'default',
          tapHandler: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => BaseScreen(
                  "Categorias",
                  "Quais categorias você se encaixa?",
                  CategoryScreen(),
                  null,
                ),
              ),
            );
          },
          isSmall: false,
        ),
        SizedBox(
          height: 20.0,
        ),
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
          height: 30,
          width: 30,
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
