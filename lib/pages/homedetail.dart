import 'package:cataloge/models/cataloge.dart';
import 'package:cataloge/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Homedetail extends StatelessWidget {
  const Homedetail({super.key, required this.catalog})
      : assert(catalog != null);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          catalog.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price.toString()}".text.xl4.bold.make(),
            ElevatedButton(
              child: "Buy".text.bold.xl.make(),
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).box.make().wh(100, 50),
          ],
        ).px32().wh(150, 130),
      ),
      drawer: Mydrawer(),
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(children: [
                    catalog.name.text.bold.size(25).make(),
                    catalog.desc.text.xl
                        .textStyle(
                          context.captionStyle,
                        )
                        .make(),
                    10.heightBox,
                  ]).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
