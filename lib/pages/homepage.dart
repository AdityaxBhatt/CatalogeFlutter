import 'package:cataloge/models/cataloge.dart';
import 'package:cataloge/widgets/itemWidget.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  int day = 8;
  final dummylist = List.generate(20, (index) => CatalogeModel.item[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dummylist.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummylist[index],
          );
        },
      ),
      drawer: Mydrawer(),
    );
  }
}
