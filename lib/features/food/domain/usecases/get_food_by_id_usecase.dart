import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/food/domain/repositories/food_repository.dart';

class GetFoodByIdUsecase extends Usecase<Datastate<FoodModel?>, String> {
  final FoodRepository foodRepository;

  GetFoodByIdUsecase(this.foodRepository);

  @override
  Future<Datastate<FoodModel?>> call(String params) {
    return foodRepository.getFoodItemById(params);
  }
}
