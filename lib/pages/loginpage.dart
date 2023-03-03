import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 40,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
