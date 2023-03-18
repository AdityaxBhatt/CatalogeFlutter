import 'package:cataloge/core/store.dart';
import 'package:cataloge/pages/cartpage.dart';
import 'package:cataloge/pages/homepage.dart';
import 'package:cataloge/utils/routes.dart';
import 'package:cataloge/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:cataloge/pages/loginpage.dart';

import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: Mystore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  int day = 8;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Themes.mytheme(context),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => HomePage(),
        Myroutes.loginpage: (context) => Loginpage(),
        Myroutes.homepage: (context) => HomePage(),
        Myroutes.cartpage: (context) => CartPage()
      },
    );
  }
}
