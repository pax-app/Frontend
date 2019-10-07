import 'package:Pax/blocs/login_bloc.dart';
import 'package:Pax/components/auth/auth_button.dart';
import 'package:Pax/screens/recover_password/recover_password.dart';
import 'package:Pax/screens/signup_screen/signup_screen.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/auth/auth_input.dart';

final _loginBloc = LoginBloc();

class LoginScreen extends StatelessWidget {
/* logout snippet for use in future
  void doLogout(BuildContext ctx) async {
    var loggedOut = await _loginBloc.logOut();
    if (loggedOut)
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return LoginScreen();
      }))};
 */

  void recoverPassword(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecoverPassordScreen();
    }));
  }

  void signUp(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return SignUpScreen();
    }));
  }

  void doLogin(BuildContext ctx, bool login) async {
    var logged;
    if (login) logged = await _loginBloc.logIn();
    logged = login ? logged : await _loginBloc.checkIfUserIsLogged();
    if (logged)
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));
  }

  @override
  Widget build(BuildContext context) {
    doLogin(context, false);
    return Scaffold(
        backgroundColor: Color(0xff454545),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 80, left: 80),
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  AuthInput(
                    labelText: "E-mail",
                    inputType: TextInputType.emailAddress,
                    onChanged: _loginBloc.emailSink,
                  ),
                  SizedBox(height: 25),
                  AuthInput(
                    labelText: "Senha",
                    obscure: true,
                    onChanged: _loginBloc.passwordSink,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  StreamBuilder<Object>(
                      stream: _loginBloc.validInputsStream,
                      builder: (context, snapshot) {
                        return AuthButton(
                            text: "Entrar",
                            onPressed: snapshot.hasData
                                ? () => this.doLogin(context, true)
                                : null);
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => this.recoverPassword(context),
                          child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "RECUPERAR A SENHA",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => this.signUp(context),
                          child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "CRIE UMA CONTA",
                              style: TextStyle(
                                  color: Color(0xff78aa43), fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
