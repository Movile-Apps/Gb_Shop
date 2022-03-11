import 'package:flutter/material.dart';
class AppTheme{
  static const Color primaryColor = Colors.greenAccent;
  static const double globalElevation = 0;
  // ignore: non_constant_identifier_names
  static final ThemeData LightTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.greenAccent,
      centerTitle: true,
      elevation: globalElevation
    ),
  
    //textForm
    inputDecorationTheme: InputDecorationTheme(
      iconColor: primaryColor,
      prefixIconColor: primaryColor,
      suffixIconColor: primaryColor,
      labelStyle: const TextStyle(color: primaryColor),
      hintStyle: const TextStyle(color: primaryColor),
      helperStyle: const TextStyle(color: primaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(12)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(12)
      )
    )
  );
}
