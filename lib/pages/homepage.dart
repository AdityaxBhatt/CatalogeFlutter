// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cataloge/core/store.dart';
import 'package:cataloge/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cataloge/models/cataloge.dart';
import 'package:cataloge/pages/homedetail.dart';
import 'package:cataloge/utils/routes.dart';

import '../widgets/home_widget/addToCart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int day = 8;

  @override
  void initState() {
    super.initState();
    loadjson();
  }

  loadjson() async {
    await Future.delayed(const Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString(
        "/Users/adityabhatt/MobileDev/cataloge/assets/files/catalog.json");
    var decodedjson = jsonDecode(catalogJson);
    var productdata = decodedjson["products"];
    CatalogeModel.item =
        List.from(productdata).map<Item>((item) => Item.frommap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as Mystore).cart;
    return Scaffold(
      floatingActionButton: VxConsumer(
          notifications: const {},
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) {
            return FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Myroutes.cartpage),
              child: const Icon(CupertinoIcons.cart),
            ).badge(
                color: Vx.red500,
                size: 22,
                count: cart.items.length,
                textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold));
          }),
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Topbar(),
            if (CatalogeModel.item.isNotEmpty)
              const Showlist().expand()
            else
              const CircularProgressIndicator().centered().expand(),
          ]),
        ),
      ),
    );
  }
}

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Baazar App".text.xl5.bold.color(const Color(0xFF3346B5)).make(),
      "Trending Products".text.xl.make(),
    ]);
  }
}

class Showlist extends StatelessWidget {
  const Showlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogeModel.item.length,
      itemBuilder: (context, index) {
        final catalog = CatalogeModel.item[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Homedetail(
                          catalog: catalog,
                        ))),
            child: CatalogItem(catalog: catalog));
      },
    ).py1();
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .color(const Color(0xfff5f5f5))
              .p1
              .alignCenter
              .rounded
              .make()
              .p16()
              .w40(context),
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.bold.size(15).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price.toString()}".text.make(),
                    AddToCart(
                      catalog: catalog,
                    ).box.make().px12(),
                  ],
                ).box.make().pOnly(top: 15)
              ]),
        )
      ],
    ))
        .square(150)
        .color(Colors.white)
        .roundedLg
        .make()
        .py12()
        .safeArea(bottom: false);
  }
}
