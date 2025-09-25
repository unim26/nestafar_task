import 'package:equatable/equatable.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class FoodState extends Equatable {
  final List<FoodModel>? foods;
  final FoodModel? food;
  final String? errorMessage;

  const FoodState({this.food, this.errorMessage, this.foods});

  @override
  List<Object?> get props => [foods, food, errorMessage];
}

//initial state
class FoodInitialState extends FoodState {
  const FoodInitialState() : super(foods: null, errorMessage: null, food: null);
}

//loading state
class FoodLoadingState extends FoodState {
  const FoodLoadingState() : super(foods: null, errorMessage: null, food: null);
}

//success state
class FoodSuccessState extends FoodState {
  const FoodSuccessState(List<FoodModel>? foods, FoodModel? food)
    : super(foods: foods, errorMessage: null, food: food);
}

//error state
class FoodErrorstate extends FoodState {
  const FoodErrorstate(String message)
    : super(errorMessage: message, food: null, foods: null);
}
