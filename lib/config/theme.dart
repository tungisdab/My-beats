import 'package:flutter/material.dart';
import 'package:my_beats/config/color.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: bgColor,
    primary: primaryColor,
  ),
  
  textTheme:const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: fontColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: fontColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: lableColor,
    ),
  )

);