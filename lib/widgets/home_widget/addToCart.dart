import 'package:cataloge/core/store.dart';
import 'package:cataloge/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cataloge.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as Mystore).cart;
    bool isIncart = cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isIncart) {
            AddMutation(catalog);
          } else {
            RemoveMutation(catalog);
          }
        },
        style: ButtonStyle(shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isIncart
            ? const Icon(CupertinoIcons.check_mark)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
