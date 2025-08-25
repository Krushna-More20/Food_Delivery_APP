import 'package:flutter/material.dart';

import 'package:food_delivery_app/controller/food_controller.dart';
import 'package:food_delivery_app/view/categorymealscreen.dart';
import 'package:food_delivery_app/view/mealcard.dart';
import 'package:get/get.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final controller = Get.put(FoodController());
   
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.isLoadingCategories.value) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Good Food 🍴",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for food...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return Obx(() => GestureDetector(
                        onTap: () => controller.changeCategory(category.name),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.selectedCategory.value == category.name
                                ? Colors.orange
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: controller.selectedCategory.value == category.name
                                ? Colors.white
                                : Colors.black87,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(18, 24, 18, 8),
                  child: Text(
                    "What's on your mind?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),

                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => CategoryMealsScreen(category: category)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 0,
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  category.image,
                                  width: 150,
                                 // scale: 30,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.fastfood, color: Colors.grey);
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            category.name,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(18, 24, 18, 10),
                  child: Text(
                    "Meals",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),

              
                Obx(() {
                  if (controller.isLoadingMeals.value) {
                    return const Center(
                      child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ));
                  }

                  if (controller.meals.isEmpty) {
                    return const Center(child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text("No meals found for this category."),
                    ));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: controller.meals.length,
                    itemBuilder: (context, index) {
                      final meal = controller.meals[index];
                      return MealCard(meal: meal);
                    },
                  );
                }),
                 const SizedBox(height: 20), 

                 
              ],
            );
          }),
          
        ),
    );
  }
}
