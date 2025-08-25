

class Meal {
  final String id;
  final String name;
  final String thumbnail;
  final int price;


  Meal({required this.id, required this.name, required this.thumbnail, required this.price, }); 



  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? 'Unknown Meal',
      thumbnail: json['strMealThumb'] ?? '',
      price: 300,
    );
  }
}
