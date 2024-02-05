import 'package:flutter/material.dart';
import 'package:my_beats/config/color.dart';

final bgColor = LinearGradient(
    colors: [Colors.deepPurple.shade200, Colors.blue.shade300],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

final darkTheme = ThemeData(
  
  useMaterial3: true,
  // brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: bgColor.colors[0],
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