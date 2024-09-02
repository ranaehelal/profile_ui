import 'package:flutter/material.dart';

ColorScheme lightColorScheme = ColorScheme.light(
    primary: Colors.black!,
    secondary: Colors.blue[900]!);

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
);

TextTheme textTheme = TextTheme(
  titleLarge: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  bodyMedium: const TextStyle(color: Colors.black),
);
