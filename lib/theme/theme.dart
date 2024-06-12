import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
  ),
);

// dark mode

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 26, 26, 26),
    primary: const Color.fromARGB(255, 33, 33, 33),
    secondary: const Color.fromARGB(255, 49, 49, 49),
    inversePrimary: Colors.grey.shade300,
  ),
);
