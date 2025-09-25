import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class UpdateCartUsecase extends Usecase<Datastate<bool>, FoodModel> {
  //cart repo
  final CartRepository _cartRepository;

  //constructure
  UpdateCartUsecase(this._cartRepository);

  @override
  Future<Datastate<bool>> call(FoodModel params) {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => _cartRepository.updateCart(params),
    );
  }
}
