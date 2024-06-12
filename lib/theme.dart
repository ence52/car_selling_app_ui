import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = const Color.fromARGB(255, 244, 246, 250);
Color textColor = const Color.fromARGB(255, 45, 49, 66);
Color textColor2 = const Color.fromARGB(255, 133, 133, 134);
Color textPinkColor = const Color.fromARGB(255, 248, 62, 115);
Color buttomBarIconColor = const Color.fromARGB(255, 186, 188, 194);
Color selectedButtomBarIconColor = const Color.fromARGB(255, 107, 109, 112);
TextStyle textStyle = GoogleFonts.poppins(fontWeight: FontWeight.w500);

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: backgroundColor),
    ));
