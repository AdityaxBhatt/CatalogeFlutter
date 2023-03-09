import 'package:cataloge/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  final imageurl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDI9eA0666I1JBFbNnzUD15XM29DJX2w8Co2I9ilTq&s';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF3346B5),
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: Text(
                    "Aditya Bhatt",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                accountEmail: null,
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageurl)),
              )),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Myroutes.homepage);
            },
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              "Messages",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
