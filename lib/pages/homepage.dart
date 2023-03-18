// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';


import 'package:cataloge/models/cataloge.dart';
import 'package:cataloge/pages/homedetail.dart';
import 'package:cataloge/utils/routes.dart';
import 'package:cataloge/widgets/itemWidget.dart';


import '../widgets/home_widget/addToCart.dart';

class HomePage extends StatefulWidget {
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

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Myroutes.cartpage),
        child: Icon(CupertinoIcons.cart),
      ).px16(),
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Topbar(),
            if (!CatalogeModel.item.isEmpty)
              Showlist().expand()
            else
              CircularProgressIndicator().centered().expand(),
          ]),
        ),
      ),
    );
  }
}

class Topbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(Color(0xFF3346B5)).make(),
      "Trending Products".text.xl.make(),
    ]);
  }
}

class Showlist extends StatelessWidget {
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

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .color(Color(0xfff5f5f5))
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


