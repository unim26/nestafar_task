import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';
import 'package:nestafar_task/features/food/domain/repositories/food_repository.dart';

class GetFoodItemsUsecase extends Usecase<Datastate<List<FoodModel>>, Null> {
  final FoodRepository foodRepository;

  GetFoodItemsUsecase(this.foodRepository);

  @override
  Future<Datastate<List<FoodModel>>> call(Null params) {
    print('calling get foods usecase');
    return foodRepository.getFoodItems();
  }
}
