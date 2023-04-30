import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.indigo.shade800,
        ),
    textTheme: _textTheme,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: Colors.black,
        ),
    textTheme: _textTheme,
  );

  static TextTheme get _textTheme => GoogleFonts.robotoTextTheme();
}
