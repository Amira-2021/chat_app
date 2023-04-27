import 'dart:async';
import 'package:chatapp/screens/account/create_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   static const String routeNamed="splash";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacementNamed(context, AccountScreen.routeNamed));
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: Container(
            child: Image.asset('assets/images/splash/logo.png'),
          ),
        ),
      ],
    );
  }
}
