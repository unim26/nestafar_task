import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartUsecase extends Usecase<Datastate<bool>, String> {
  //cart repo
  final CartRepository _cartRepository;

  //constructure
  RemoveFromCartUsecase(this._cartRepository);

  @override
  Future<Datastate<bool>> call(String params) {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => _cartRepository.removeFromCart(params),
    );
  }
}
