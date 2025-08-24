
import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/bottomnavigation.dart';
import 'package:food_delivery_app/view/homescreen.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset("assets/done.png",
            width: 180,
            height: 180,
            fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              "Your Order has been\naccepted",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(24, 23, 37, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              "Your items has been placed and is on\nit's way to being processed",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(124, 124, 124, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () => Get.offAll(() => Bottomnavigation()),
              child: const Text(
                "Back to home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(24, 23, 37, 1),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}