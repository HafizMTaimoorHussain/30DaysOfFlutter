// ignore_for_file: use_key_in_widget_constructors, unused_import, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/cart.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: unused_import
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      // themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/": (context) => Login(),
        // "/": (context) => Home(),
        AppRoutes.HomeRoute: (context) => Home(),
        AppRoutes.CartRoute: (context) => CartPage()
      },
    );
  }
}
