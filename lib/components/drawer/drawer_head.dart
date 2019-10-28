import 'package:Pax/blocs/login_bloc.dart';
import 'package:Pax/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

final _loginBloc = LoginBloc();

class DrawerHead extends StatelessWidget {
  String img, name;
  double qntStars;
  PageController controller;

  DrawerHead(this.img, this.name, this.qntStars, this.controller);

  void doLogout(BuildContext ctx) async {
    var loggedOut = await _loginBloc.logOut();
    if (loggedOut)
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return LoginScreen();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 56,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.jumpToPage(0);
                  },
                  child: Image.asset(
                    'assets/logo/sidebar_logo.png',
                    height: 30,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 130,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //image: DecorationImage(),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      )),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.only(left: 140, top: 20),
                      child: InkWell(
                        onTap: () => doLogout(context),
                        child: Text(
                          "Sair",
                          style:
                              TextStyle(color: Theme.of(context).buttonColor),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
