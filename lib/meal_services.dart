import 'dart:convert';
import 'package:food_delivery_app/models/meal_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/models/category_model.dart';


class MealServices {
  // Fetches list of all food categories
  Future<List<Category>> getCategories() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      // The API returns a map with a 'categories' key, which holds the list
      final List data = decoded['categories'];
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load categories');
    }
  }

  // Fetches the list of meals for a specific category
  Future<List<Meal>> getMealsByCategory(String category) async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
    final response = await http.get(url);

    if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        // The API can return 'null' if the category has no meals, so we handle that.
        final List data = decoded['meals'] ?? [];
        return data.map((e) => Meal.fromJson(e)).toList();
    } else {
        throw Exception('Failed to load meals for category: $category');
    }
  }
}