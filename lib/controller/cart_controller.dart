
import 'package:food_delivery_app/models/meal_model.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  var cartItems = <Meal>[].obs;
  var itemQuantities = <int>[].obs; 

  void addToCart(Meal meal) {
    int index = cartItems.indexWhere((item) => item.id == meal.id);
    if (index >= 0) {
      itemQuantities[index]++;
    } else {
      cartItems.add(meal);
      itemQuantities.add(1);
    }
  }

  void increaseQuantity(int index) {
    itemQuantities[index]++;
    itemQuantities.refresh();
  }

  void decreaseQuantity(int index) {
    if (itemQuantities[index] > 1) {
      itemQuantities[index]--;
    } else {
      removeFromCart(cartItems[index]);
    }
  }

  void removeFromCart(Meal meal) {
    int index = cartItems.indexWhere((item) => item.id == meal.id);
    if (index >= 0) {
      cartItems.removeAt(index);
      itemQuantities.removeAt(index);
    }
  }

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].price * itemQuantities[i];
    }
    return total;
  }
}
