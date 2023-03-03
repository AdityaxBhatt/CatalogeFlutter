import 'package:cataloge/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int day = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
