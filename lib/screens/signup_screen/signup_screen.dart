import 'package:Pax/blocs/signup_bloc.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pax/screens/home_screen/home_screen.dart';
import '../../components/auth/auth_input.dart';

final _signupBloc = SignUpBloc();

class SignUpScreen extends StatelessWidget {
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

  void doSignUp(BuildContext ctx) async {
    var logged = await _signupBloc.signUp();
    if (logged == 200) /*  */
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));
    else if (logged == 500 || logged == 503) //Erro ao conectar ao DB
      _showDialog(ctx, "Tente novamente mais tarde.");
    else if (logged == 400) // Email ja cadastrado
      _showDialog(ctx, "Email já cadastrado.");
    else
      _showDialog(ctx, "Erro cod. $logged.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo/pax-logo.png'),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 30),
                  AuthInput(
                    stream: _signupBloc.name,
                    labelText: "Nome",
                    onChanged: _signupBloc.changeName,
                  ),
                  SizedBox(height: 20),
                  AuthInput(
                    stream: _signupBloc.cpf,
                    labelText: "CPF",
                    inputType: TextInputType.number,
                    onChanged: _signupBloc.changeCPF,
                  ),
                  SizedBox(height: 20),
                  AuthInput(
                    stream: _signupBloc.email,
                    labelText: "E-mail",
                    inputType: TextInputType.emailAddress,
                    onChanged: _signupBloc.changeEmail,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: AuthInput(
                          stream: _signupBloc.password,
                          labelText: "Senha",
                          obscure: true,
                          onChanged: _signupBloc.changePassword,
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: AuthInput(
                          labelText: "Confirmar",
                          stream: _signupBloc.confirmPassword,
                          obscure: true,
                          onChanged: _signupBloc.changePasswordConfirmation,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: "LI E ACEITO OS ",
                                style: Theme.of(context).textTheme.body2),
                            TextSpan(
                              text: "TERMOS DE USO",
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: StreamBuilder<bool>(
                          stream: _signupBloc.useTerms,
                          builder: (context, snapshot) {
                            return Checkbox(
                              onChanged: _signupBloc.changeUseTerms,
                              value: snapshot.hasData ? snapshot.data : false,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: Color(0xff78aa43),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  StreamBuilder<bool>(
                    stream: _signupBloc.validInputsStream,
                    builder: (context, snapshot) {
                      return Button(
                        buttonText: "Criar",
                        tapHandler: snapshot.hasData
                            ? () => this.doSignUp(context)
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
