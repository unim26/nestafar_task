import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/food/domain/repositories/food_repository.dart';

class GetFoodByCategoryUsecase extends Usecase<Datastate<List<FoodModel>>,String>{
  final FoodRepository foodRepository;

  GetFoodByCategoryUsecase(this.foodRepository);

  @override
  Future<Datastate<List<FoodModel>>> call(String params) {
    return foodRepository.getFoodItemsByCategory(params);
  }
}
