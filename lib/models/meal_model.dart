import 'package:get/get.dart';

class Meal {
  final String id;
  final String name;
  final String thumbnail;
  final int price;
//  final RxInt quantity;

  Meal({required this.id, required this.name, required this.thumbnail, required this.price, /*int initialQuantity = 1*/}); /*: quantity = initialQuantity.obs;*/

//  double get itemSubtotal => meal.price * quantity.value;*/

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? 'Unknown Meal',
      thumbnail: json['strMealThumb'] ?? '',
      price: 300,
    );
  }
}
