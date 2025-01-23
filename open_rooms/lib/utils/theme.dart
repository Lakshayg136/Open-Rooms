import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Pallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(25),
          hintStyle: TextStyle(color: Pallete.textColor),
          labelStyle: TextStyle(color: Pallete.textColor),
          enabledBorder: _border(Pallete.borderColor),
          focusedBorder: _border(Pallete.borderColor)));
}
