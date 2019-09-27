import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff454545),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 180,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 60, bottom: 40),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'E-mail'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Senha'),
                  ),
                ),

                // alignment: CrossAxisAlignment.stretch,

                RaisedButton(
                  onPressed: () {},
                  child: Text("Entrar"),
                ),

                Row(
                  children: <Widget>[
                    Text("Recuperar a senha"),
                    Text("Crie uma conta")
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
