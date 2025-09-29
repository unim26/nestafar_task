import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/cart/data/data_services/cart_data_service.dart';
import 'package:nestafar_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class CartRepositoryImpl implements CartRepository{

  //cart data service
  CartDataService cartDataService;

  //constructor
  CartRepositoryImpl(this.cartDataService);

  @override
  Datastate<bool> addToCart(FoodModel foodModel) {
    try {
      final response = cartDataService.addToCart(foodModel);

      if (response) {
        return DataSuccess(response);
      }
      else{
        return DataFailed('Failed to add iteam to cart');
      }

    } catch (e) {
      return DataFailed('Failed to add iteam to cart');

    }
  }

  @override
  Datastate<List<FoodModel>> getCart() {
    try {
      final response = cartDataService.getCart();

      if (response.isNotEmpty) {
        return DataSuccess(response);
      }
      else{
        return DataSuccess([]); //return empty list if cart is empty
      }

    } catch (e) {
      return DataFailed('Failed to get cart');

    }
  }

  @override
  Datastate<bool> removeFromCart(String foodid) {
    try {
      final response = cartDataService.removeFromCart(foodid);

      if (response) {
        return DataSuccess(response);
      }
      else{
        return DataFailed('Failed to remove iteam from cart');
      }

    } catch (e) {
      return DataFailed('Failed to remove iteam from cart');

    }
  }


}
