import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class CartRepository {

  //method to add to cart
  Datastate<bool> addToCart(FoodModel foodModel);

  //method to update cart
  Datastate<bool> updateCart(FoodModel foodModel);

  //method to get cart iteams
  Datastate<List<FoodModel>> getCart();

  //method to remove from cart
  Datastate<bool> removeFromCart(String foodid);
}
