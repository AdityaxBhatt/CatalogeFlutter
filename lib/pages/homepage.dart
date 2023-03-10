import 'dart:convert';

import 'package:cataloge/models/cataloge.dart';
import 'package:cataloge/widgets/itemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';

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
      appBar: AppBar(
        title: const Text("Catalog App",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: (CatalogeModel.item.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogeModel.item.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: CatalogeModel.item[index],
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
      drawer: Mydrawer(),
    );
  }
}
