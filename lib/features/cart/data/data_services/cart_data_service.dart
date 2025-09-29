import 'package:nestafar_task/features/food/data/models/food_model.dart';

class CartDataService {
  //list to store iteams in carts
  List<FoodModel> _cart = [];

  //add to _cart
  bool addToCart(FoodModel foodModel) {
    _cart.add(foodModel);

    print('item added');
    print(_cart);

    return true;
  }

  //get cart iteams
  List<FoodModel> getCart() {
    print(_cart);
    return _cart;
  }

  bool removeAllFromCart() {
    _cart.clear();
    return true;
  }

  //remove from cart
  bool removeFromCart(String foodid) {
    _cart.removeWhere((food) => food.id == foodid);

    return true;
  }
}
