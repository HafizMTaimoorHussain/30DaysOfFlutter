// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_demo/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days = 40;

  final String name = "Peter Parker";

  final url = "https://91a3-202-143-127-149.ngrok.io/api/footballers";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // when reading from json file //
    // final loadedData = await rootBundle.loadString("assets/files/catalog.json");
    // final catalogData = jsonDecode(loadedData);

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final catalogData = jsonDecode(catalogJson);
    // print('value : $catalogData');
    var products = catalogData['products'];
    CatalogModel.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // replacing Material with Scaffold b/c it is a component of material which is used for UI
    return Scaffold(
      // appBar: AppBar(
      //   // Text, Container and other similar these are all consider as Widgets in dart
      //   title: Text(
      //     "Catalog App",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // body: (CatalogModel.items.isNotEmpty) ?
      //   // *** list view *** //
      //   // ListView.builder(
      //   //   itemCount: CatalogModel.items.length,
      //   //   itemBuilder: (context, index)
      //   //   => ItemWidget(
      //   //     item: CatalogModel.items[index],
      //   //   ),
      //   // )
      //   // *** grid view *** //

      // : Center(child: CircularProgressIndicator()),
      // drawer: MyDrawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (ctx, int, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.CartRoute),
          backgroundColor: context.theme.backgroundColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white),
        ).badge(
          color: Colors.white,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
