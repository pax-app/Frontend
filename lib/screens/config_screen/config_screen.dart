import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SimpleTile("Editar Perfil", (){}),
        SimpleTile("Mudar Senha", (){}),
      ],
    );
  }
}
