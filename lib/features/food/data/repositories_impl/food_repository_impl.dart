import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/food/data/data_services/food_data_service.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/food/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodDataService foodDataService;

  FoodRepositoryImpl(this.foodDataService);

 @override
  Future<Datastate<List<FoodModel>>> getFoodItems() async{
   try {
     final foodItems = await foodDataService.getAllFoods();
     if (foodItems.isNotEmpty) {
       return DataSuccess(foodItems);
     } else {
       return DataFailed("No food found");

     }
   } catch (e) {
     return DataFailed("Failed to fetch foods");
   }
  }

@override
  Future<Datastate<FoodModel?>> getFoodItemById(String id) async{
    try {
      final foodItem = await foodDataService.getFoodById(id);
      if (foodItem != null) {
        return DataSuccess(foodItem);
      } else {
        return DataFailed("Food  not found");
      }
    } catch (e) {
      return DataFailed("Failed to fetch food");
    }
  }

@override
  Future<Datastate<List<FoodModel>>> getFoodItemsByCategory(String category) async {
    try {
      final foodItems = await foodDataService.getFoodsByCategory(category);
      if (foodItems.isNotEmpty) {
        return DataSuccess(foodItems);
      } else {
        return DataFailed("No food found");

      }
    } catch (e) {
      return DataFailed("Failed to fetch foods");
    }
  }


}

