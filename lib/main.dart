import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/view/cartscreen.dart';
import 'package:food_delivery_app/view/checkout.dart';
import 'package:food_delivery_app/view/homescreen.dart';
import 'package:food_delivery_app/view/splashscreen.dart';
import 'package:get/get.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyAMX4WjcQHfm552sNR9xrXRvLT0fB1ClLo",
     appId: "1:413777083324:android:a6bc0673f302e7712449b9",
     messagingSenderId: "413777083324",
      projectId: "food-app-54963",)
  );
  Get.put(CartController());
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  dynamic? email;
  dynamic? password;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final width = media.width;
    final height = media.height;
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
