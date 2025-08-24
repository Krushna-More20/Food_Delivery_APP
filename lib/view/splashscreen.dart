
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/authwrapper.dart';
import 'package:food_delivery_app/view/bottomnavigation.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
   @override
  void initState() {
    super.initState();

    Timer(Duration(seconds:5),() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthWrapper()),
      );
    });        
  }    

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/food-logo.jpg",
            width: 140,
            height: 140,
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

