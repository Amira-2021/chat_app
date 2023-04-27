import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeNamed="home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome",style: TextStyle(fontSize: 50),),),
    );
  }
}
