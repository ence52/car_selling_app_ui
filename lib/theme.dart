import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgrondColor = const Color.fromARGB(255, 244, 246, 250);
Color textColor = const Color.fromARGB(255, 45, 49, 66);
Color textColor2 = const Color.fromARGB(255, 133, 133, 134);
Color textPinkColor = const Color.fromARGB(255, 248, 62, 115);
TextStyle textStyle = GoogleFonts.poppins(fontWeight: FontWeight.w500);

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: backgrondColor,
    appBarTheme: AppBarTheme(backgroundColor: backgrondColor));
