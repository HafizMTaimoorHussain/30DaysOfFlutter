// ignore_for_file: unnecessary_import, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        toggleableActiveColor: darkBluishColor,
        cardColor: Colors.white,
        canvasColor: creamColor,
        backgroundColor: darkBluishColor,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        // fontFamily: GoogleFonts.lato().fontFamily,
        fontFamily: GoogleFonts.poppins().fontFamily,
        toggleableActiveColor: Colors.white,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        backgroundColor: lightBluishColor,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme),
      );

  // *** Colors *** //
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
