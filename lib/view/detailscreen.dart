
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/view/cartscreen.dart';
import 'package:food_delivery_app/view/checkout.dart';
import 'package:food_delivery_app/view/homescreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../models/meal_model.dart';


class DetailScreen extends StatelessWidget {
  

  const DetailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final Meal meal = Get.arguments as Meal;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                 const SizedBox(
                    width: 20,
                  ),
                  
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey),
                      width: 35,
                      height: 35,             
                      child: const Icon(
                        Icons.arrow_back_outlined, 
                        size: 25,
                        color: Colors.white,
                        )
                     ),
                  ),    
                ],
              ),         
          Container(
            padding: const EdgeInsetsDirectional.all(10.0),
            width: 400,
            height: 380,
            child: Image.network(
              meal.thumbnail,  
              fit: BoxFit.cover
             )
           ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              meal.name,
              style: const TextStyle(
                fontSize: 23, 
                fontWeight: FontWeight.w700
                ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  final cartController = Get.find<CartController>();
                   cartController.addToCart(meal); 
                  Get.to(() => Cartscreen(),);
                },
                child: Container(
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    boxShadow:const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                      )
                    ],
                    color: Color.fromARGB(255, 131, 218, 168),
                  ),              
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                      ),
                    ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  final cartController = Get.find<CartController>();
                   cartController.addToCart(meal); 
                  Get.to(() => const Checkout());
                },
                child: Container(
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    boxShadow:const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                      )
                    ],
                    color: Color.fromARGB(255, 131, 218, 168),
                  ),              
                  child: const Text(
                    "checkout",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                      ),
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
      
    );
  }
}
