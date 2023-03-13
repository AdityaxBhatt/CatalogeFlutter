import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Themes {
  static ThemeData mytheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
  static ThemeData darktheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

  static Color darkcolor = Vx.gray800;
  static Color darkpurple = Vx.purple700;
}
