import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class CartEvent {
  const CartEvent();
}


//event to add food to cart
class AddToCartEvent extends CartEvent{
  final FoodModel food;

  AddToCartEvent({required this.food});
}

//event to remove food from cart
class RemoveFromCartEvent extends CartEvent{
  final String foodId;

  RemoveFromCartEvent({required this.foodId});
}

//event to clear cart
class UpdateCartEvent extends CartEvent{
  final FoodModel food;
  const UpdateCartEvent({required this.food});
}