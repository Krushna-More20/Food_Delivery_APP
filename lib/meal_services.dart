import 'dart:convert';
import 'package:food_delivery_app/models/meal_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_app/models/category_model.dart';


class MealServices {
  Future<List<Category>> getCategories() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List data = decoded['categories'];
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
    final response = await http.get(url);

    if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List data = decoded['meals'] ?? [];
        return data.map((e) => Meal.fromJson(e)).toList();
    } else {
        throw Exception('Failed to load meals for category: $category');
    }
  }
}