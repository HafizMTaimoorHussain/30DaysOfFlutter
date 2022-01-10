// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/drawer.dart';

class Home extends StatelessWidget {
  // *** Datatypes With Basic Concepts *** //
  // int days = 40; it is used for integer.
  // double temp = 40.5; it is used for floating values;
  // num days = 40; OR num temp = 40.5; it is used for both integer and floating values;
  // String name = "Peter parker"; it is used for string values;
  // bool isMale = true; it is used for boolean values;
  // var day = "Sunday"; it is a variable in which we can any type of value and compiler itself decide which datatype it is by the help of passed value.
  // const pie = 3.14; it is used for those values that can never be changes and remained same always.
  // final list = 19; it is same as constant but its value can be changed if needed
  // //
  final int days = 40;
  final String name = "Peter Parker";

  //
  // bringFood(rupees: 50); if I set value of rupees so it will take it as 50 otherwise it will used predined value which is 100
  //
  // basic concept of methods
  // if I set @required before bool ColdDrink so it will give error if I don't pass bool value;
  // bringFood({bool ColdDrink, int rupees = 100}) {
  //  Take my bike
  //
  //  Go to bihaari for zinger
  // }
  //
  // //

  @override
  Widget build(BuildContext context) {
    // replacing Material with Scaffold b/c it is a component of material which is used for UI
    return Scaffold(
      appBar: AppBar(
        // Text, Container and other similar these are all consider as Widgets in dart
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter learning by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
