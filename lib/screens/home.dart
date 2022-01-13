// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days = 40;

  final String name = "Peter Parker";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final loadedData = await rootBundle.loadString("assets/files/catalog.json");
    final catalogData = jsonDecode(loadedData);
    var products = catalogData['products'];
    CatalogModel.items = List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    // replacing Material with Scaffold b/c it is a component of material which is used for UI
    return Scaffold(
      appBar: AppBar(
        // Text, Container and other similar these are all consider as Widgets in dart
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: (CatalogModel.items.isNotEmpty) ?
        ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index)
          => ItemWidget(
            item: CatalogModel.items[index],
          ),
      ) : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
    );
  }
}
