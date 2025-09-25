abstract class FoodEvent {
  const FoodEvent();
}

class GetFoods extends FoodEvent {
  GetFoods();
}

class GetFoodByIdEvent extends FoodEvent {
  final String foodId;

  GetFoodByIdEvent({required this.foodId});
}

class GetFoodByCategoryEvent extends FoodEvent {
  final String category;

  GetFoodByCategoryEvent({required this.category});
}
