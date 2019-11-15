import 'package:Pax/blocs/login_bloc.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/config_screen/tabs/edit-password.dart';
import 'package:Pax/screens/config_screen/tabs/edit-profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pax/screens/login_screen/login_screen.dart';

class ConfigScreen extends StatelessWidget {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SimpleTile(
          "Editar Perfil",
          () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => BaseScreen(
                  "",
                  "",
                  EditPerfilTab(),
                  null,
                ),
              ),
            );
          },
        ),
        SimpleTile(
          "Mudar Senha",
          () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => BaseScreen(
                  "",
                  "Mudar Senha",
                  EditPasswordTab(),
                  null,
                ),
              ),
            );
          },
        ),
        SimpleTile(
          "Sair",
          () async {
            var loggedOut = await _loginBloc.logOut();
            if (loggedOut)
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()));
          },
        ),
      ],
    );
  }
}
