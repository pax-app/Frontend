import 'package:Pax/blocs/signup_bloc.dart';
import 'package:Pax/components/auth/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/auth/auth_input.dart';

class SignUpScreen extends StatelessWidget {
  handler(bool param) {}

  final _signupBloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff454545),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 80, left: 80),
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                  SizedBox(height: 30),
                  AuthInput(
                    labelText: "Nome",
                    onChanged: _signupBloc.nameSink,
                  ),
                  SizedBox(height: 20),
                  AuthInput(
                    labelText: "CPF",
                    inputType: TextInputType.number,
                    onChanged: _signupBloc.cpfSink,
                  ),
                  SizedBox(height: 20),
                  AuthInput(
                    labelText: "E-mail",
                    inputType: TextInputType.emailAddress,
                    onChanged: _signupBloc.emailSink,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: AuthInput(
                          labelText: "Senha",
                          obscure: true,
                          onChanged: _signupBloc.passwordSink,
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: AuthInput(
                          labelText: "Confirmar",
                          obscure: true,
                          onChanged: _signupBloc.passwordConfirmationSink,
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
                              TextSpan(text: "LI E ACEITO OS "),
                              TextSpan(
                                  text: "TERMOS DE USO",
                                  style: TextStyle(color: Color(0xff78aa43)))
                            ])),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: StreamBuilder<bool>(
                              stream: _signupBloc.useTerms,
                              builder: (context, snapshot) {
                                return Checkbox(
                                  onChanged: _signupBloc.useTermsSink,
                                  value:
                                      snapshot.hasData ? snapshot.data : false,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: Color(0xff78aa43),
                                );
                              }),
                        )
                      ]),
                  SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<bool>(
                      // stream: _signupBloc.validInputsStream,
                      builder: (context, snapshot) {
                    return AuthButton(
                      text: "Criar",
                      // onPressed:
                      //     snapshot.hasData ? _signupBloc.signUp : null,
                      onPressed: _signupBloc.signUp,
                    );
                  }),
                ],
              ),
            ),
          )
        ]));
  }
}
