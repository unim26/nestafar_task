import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class FoodRepository {

  // get a list of food items
  Future<Datastate<List<FoodModel>>> getFoodItems();

  // get a single food item by its ID
  Future<Datastate<FoodModel?>> getFoodItemById(String id);

  // get food items by category
  Future<Datastate<List<FoodModel>>> getFoodItemsByCategory(String category);

}
