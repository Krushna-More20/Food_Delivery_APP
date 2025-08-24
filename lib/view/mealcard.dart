import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/meal_model.dart';
import '../view/detailscreen.dart';
import 'package:get/get.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const DetailScreen(), arguments: meal),
      child: Card(
        elevation: 2,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                meal.thumbnail,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                meal.name,
                maxLines: 2,
               // overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}