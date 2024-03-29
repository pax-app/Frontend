import 'package:Pax/blocs/main_bloc.dart';
import 'package:Pax/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:Pax/screens/login_screen/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:Pax/screens/home_screen/home_screen.dart';

void main() => runApp(PaxApp());

class PaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("pt-BR", null);
    return MainBloc(MaterialApp(
      title: 'Pax',
      theme: paxTheme,
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: LoginScreen(),
    ));
  }
}
