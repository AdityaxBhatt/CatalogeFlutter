// ignore_for_file: prefer_const_constructors

import 'dart:ffi' as ffi;
import 'dart:ui';
import 'package:cataloge/pages/homepage.dart';
import 'package:cataloge/utils/routes.dart';
import 'package:flutter/material.dart';

String name = "";

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

final _formKey = GlobalKey<FormState>();

moveHome(BuildContext context) {
  if (_formKey.currentState?.validate() == true) {
    Navigator.pushNamed(context, Myroutes.homepage);
  }
}

bool flag = false;

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/undraw_Login_re_4vu2.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              flag ? "Hi! $name" : "",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Username Cannot be Empty";
                        } else {
                          name = value!;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        label: Text("Username"),
                      ),
                      onFieldSubmitted: (value) {
                        name = value;
                        if (name == "") {
                          flag = false;
                        } else {
                          flag = true;
                        }
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Password Cannot be Empty";
                        } else if (value!.length < 8) {
                          return "Password length must be atleast 8";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => moveHome(context),
                      child: Ink(
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFF3346B5),
                          borderRadius: BorderRadiusDirectional.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
