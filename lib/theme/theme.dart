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
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(vertical: 17),
    ),
    scaffoldBackgroundColor: backgroundColor,
    canvasColor: Colors.transparent,
    cardTheme: CardTheme(
      color: colorWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    ),
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
        color: primaryColor,
      ),
      subtitle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15,
        color: primaryColor,
      ),
      body1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: primaryColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: primaryColorDark,
            ),
          ),
    ),
  );
}
