import 'package:food_delivery_app/meal_services.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/models/meal_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class FoodController extends GetxController {
  final MealServices _mealServices = MealServices();

  // State for HomeScreen
  var categories = <Category>[].obs;
  var meals = <Meal>[].obs;
  var selectedCategory = ''.obs;
  var isLoadingCategories = true.obs;
  var isLoadingMeals = false.obs;

  // --- NEW --- State for CategoryMealsScreen
  var categoryMeals = <Meal>[].obs;
  var isLoadingCategoryMeals = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoadingCategories(true);
      final categoryList = await _mealServices.getCategories();
      if (categoryList.isNotEmpty) {
        categories.value = categoryList;
        changeCategory(categories[0].name);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch categories: ${e.toString()}");
    } finally {
      isLoadingCategories(false);
    }
  }

  // Fetches meals for the HomeScreen horizontal filter
  void fetchMeals(String category) async {
    try {
      isLoadingMeals(true);
      meals.value = await _mealServices.getMealsByCategory(category);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch meals: ${e.toString()}");
    } finally {
      isLoadingMeals(false);
    }
  }
  
  // --- NEW --- Fetches meals for the dedicated CategoryMealsScreen
  void fetchMealsForCategoryPage(String category) async {
    try {
      isLoadingCategoryMeals(true);
      // Clear previous results immediately for better UX
      categoryMeals.clear(); 
      categoryMeals.value = await _mealServices.getMealsByCategory(category);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch meals: ${e.toString()}");
    } finally {
      isLoadingCategoryMeals(false);
    }
  }

  void changeCategory(String name) {
    selectedCategory.value = name;
    fetchMeals(name);
  }
}
