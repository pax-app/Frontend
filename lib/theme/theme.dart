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
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: backgroundColor,
    textSelectionColor: secondaryColor,
    errorColor: errorColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
  );
}
