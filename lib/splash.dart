import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(color: Colors.green),
        ),
      ),
    ));
  }
}
