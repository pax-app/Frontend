import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData paxTheme = _buildPaxTheme();

ThemeData _buildPaxTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: secondaryColor,
    primaryColor: primaryColor,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: secondaryColor,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: backgroundColor,
    textSelectionColor: secondaryColor,
    errorColor: errorColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    textTheme: TextTheme(
      headline: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: colorWhite,
      ),
      title: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: primaryColorDark,
      ),
      body1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
      ),
    ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontFamily: 'Montserrat', fontSize: 15, color: Colors.black),
          ),
    ),
  );
}
