import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int day = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to day $day hiee"),
          ),
        ),
        drawer: Drawer());
  }
}
