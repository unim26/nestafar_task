abstract class FoodEvent {
  const FoodEvent();
}

class GetFoodsEvent extends FoodEvent {
  GetFoodsEvent();
}

class GetFoodByIdEvent extends FoodEvent {
  final String foodId;

  GetFoodByIdEvent({required this.foodId});
}

class GetFoodByCategoryEvent extends FoodEvent {
  final String category;

  GetFoodByCategoryEvent({required this.category});
}
