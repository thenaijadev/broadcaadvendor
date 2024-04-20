import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: const Color.fromARGB(255, 255, 255, 255),
      primary: const Color(0xff030E4F),
      secondary: const Color(0xffDDE2E5),
      inversePrimary: Colors.grey.shade800,
    ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey[800], displayColor: Colors.black),
  );
}
