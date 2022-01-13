// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';

class Home extends StatelessWidget {

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
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    // replacing Material with Scaffold b/c it is a component of material which is used for UI
    return Scaffold(
      appBar: AppBar(
        // Text, Container and other similar these are all consider as Widgets in dart
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
      },
      ),
      drawer: MyDrawer(),
    );
  }
}
