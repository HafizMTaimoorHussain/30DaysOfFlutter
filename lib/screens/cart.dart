import 'package:flutter/material.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
        foregroundColor: context.theme.toggleableActiveColor,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CarTotal(),
        ],
      ),
    );
  }
}

class _CarTotal extends StatelessWidget {
  const _CarTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.backgroundColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet.".text.make()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    context.theme.backgroundColor
                ),
              ),
              child: "Buy".text.white.make()
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? "Cart is empty".text.xl3.makeCentered() : ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              _cart.remove(_cart.items[index]);
              setState(() {});
            },
          ),
          title: _cart.items[index].name.text.make(),

        ),
    );
  }
}
