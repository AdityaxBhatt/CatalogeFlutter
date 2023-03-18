import 'package:cataloge/core/store.dart';
import 'package:cataloge/models/cart.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: "Cart".text.xl3.make(),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Cartview().p32().expand(),
            const Divider().h(10),
            CartTotal().p16(),
          ],
        ));
  }
}

class CartTotal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as Mystore).cart;
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          100.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${cart.totalPrice}".text.xl5.make(),
              ElevatedButton(
                child: "Proceed to Payment".text.make(),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        "This feature is not supported yet.".text.xl.make(),
                  ));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Cartview extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as Mystore).cart;
    return cart.items.isEmpty
        ? "Nothing to show".text.xl2.caption(context).makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  cart.remove(cart.items[index]);
                  // setState(() {});
                },
              ),
              title: cart.items[index].name.text.make(),
            ),
          );
  }
}
