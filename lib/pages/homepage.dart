import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int day = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to day $day hiee!!"),
          ),
        ),
        drawer: const Drawer());
  }
}
