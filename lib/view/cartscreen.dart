
import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/checkout.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../models/meal_model.dart';

class Cartscreen extends StatefulWidget {
//  final Meal meal;
  const Cartscreen({super.key, /* required this.meal */});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  final CartController cartController = Get.find<CartController>();

  void _showCheckoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Text(
                "Checkout",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),

              const ListTile(
                contentPadding: EdgeInsets.zero,
                title:  Text("Delivery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(124, 124, 124, 1) ),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Text("Select Method",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(24, 23, 37, 1)),),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              Divider(),

              // Payment
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(124, 124, 124, 1),),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.credit_card, ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              Divider(),

            
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Promo Code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(124, 124, 124, 1) ),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Pick discount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(24, 23, 37, 1)),),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              Divider(),

              
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Total Cost" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(124, 124, 124, 1) ),),
                trailing:  Text(
                  "₹${cartController.totalPrice.toStringAsFixed(2)}",
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(24, 23, 37, 1)),
                ),
              ),

              const SizedBox(height: 16),

              
              const Text(
                "By placing an order you agree to our Terms And Conditions",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => Checkout());
                  },
                  child: const Text(
                    "Place Order",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return const Center(child: Text("Your cart is empty"));
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final Meal item = cartController.cartItems[index];
                  final qty = cartController.itemQuantities[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item.thumbnail,
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "₹${item.price}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () => cartController.decreaseQuantity(index),
                                ),
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle, color: Colors.green),
                                  onPressed: () => cartController.increaseQuantity(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Bottom Total & Checkout
          Obx(() => Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -3)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: ₹${cartController.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showCheckoutSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Checkout"),
                    ),
                  ],
                ),
              )),

        ],
      ),
    );
  }
}
