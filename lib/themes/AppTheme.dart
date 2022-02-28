import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor = Colors.greenAccent;
  static const double globalElevation = 0;

  // ignore: non_constant_identifier_names
  static final ThemeData LightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: globalElevation
    )
  );
}