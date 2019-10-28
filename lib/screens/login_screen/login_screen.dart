import 'package:Pax/blocs/login_bloc.dart';
import 'package:Pax/components/auth/auth_text_button.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/screens/recover_password/recover_password.dart';
import 'package:Pax/screens/signup_screen/signup_screen.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../components/auth/auth_input.dart';

final _loginBloc = LoginBloc();

class LoginScreen extends StatelessWidget {
  Future<void> _showDialog(BuildContext context, String text) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void recoverPassword(BuildContext ctx) {
    Navigator.of(ctx)
        .push(CupertinoPageRoute(builder: (_) => RecoverPassordScreen()));
  }

  void signUp(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) => SignUpScreen()));
  }

  void doLogin(BuildContext ctx, bool login) async {
    bool logged;
    Response loginResponse = await _loginBloc.logIn();
    if (login) logged = loginResponse.statusCode == 200;
    logged = login ? logged : await _loginBloc.checkIfUserIsLogged();

    if (logged)
      Navigator.of(ctx).push(CupertinoPageRoute(builder: (_) => HomeScreen()));
    else if (login && loginResponse.statusCode == 404)
      _showDialog(ctx, 'Usuario não encontrado.');
    else if (login && loginResponse.statusCode == 500)
      _showDialog(ctx, 'Tente novamente mais tarde.');
    else if (login && loginResponse.statusCode == 401)
      _showDialog(ctx, 'Senha Incorreta.');
  }

  @override
  Widget build(BuildContext context) {
    doLogin(context, false);
    return Scaffold(
      backgroundColor: loginBgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo.png'),
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(height: 60),
                  AuthInput(
                    labelText: 'E-mail',
                    inputType: TextInputType.emailAddress,
                    onChanged: _loginBloc.emailSink,
                  ),
                  SizedBox(height: 25),
                  AuthInput(
                    labelText: 'Senha',
                    obscure: true,
                    onChanged: _loginBloc.passwordSink,
                  ),
                  SizedBox(height: 40),
                  StreamBuilder<Object>(
                    stream: _loginBloc.validInputsStream,
                    builder: (context, snapshot) {
                      return Button(
                        buttonText: 'Entrar',
                        tapHandler: snapshot.hasData
                            ? () => this.doLogin(context, true)
                            : null,
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AuthTextButton(
                          text: 'RECUPERAR SENHA',
                          onTapHandler: () => this.recoverPassword(context),
                        ),
                        AuthTextButton(
                          text: 'CRIE UMA CONTA',
                          onTapHandler: () => this.signUp(context),
                          isPrimary: true,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
