import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/food_controller.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/view/mealcard.dart';
import 'package:get/get.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;
  const CategoryMealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
   
    final controller = Get.find<FoodController>();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMealsForCategoryPage(category.name);
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoadingCategoryMeals.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.categoryMeals.isEmpty) {
              return const Center(child: Text("No meals found in this category."));
            }
            
            return Column(
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
                          
                          child: const Icon(Icons.arrow_back_outlined, size: 25,color: Colors.white,)),
                      ),
                      Text(
                        category.name,
                        style:const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                        ),
                      ),
          
                  ],
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: controller.categoryMeals.length,
                  itemBuilder: (context, index) {
                    final meal = controller.categoryMeals[index];
                    return MealCard(meal: meal);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

