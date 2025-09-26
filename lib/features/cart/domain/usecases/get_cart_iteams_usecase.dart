import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

class GetCartIteamsUsecase extends Usecase<Datastate<List<FoodModel>>,Null>{
  //cart repo
  final CartRepository _cartRepository;

  //constructure
  GetCartIteamsUsecase(this._cartRepository);

  @override
  Future<Datastate<List<FoodModel>>> call(Null params) {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => _cartRepository.getCart(),
    );
  }
}
