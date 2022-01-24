// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsPage extends StatelessWidget {
  final Item catalog;
  const DetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  context.theme.backgroundColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.theme.toggleableActiveColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "Et ut vero lorem ipsum nonumy dolore, kasd vero takimata sit dolores."
                          .text
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ).p16(),
      ),
    );
  }
}
