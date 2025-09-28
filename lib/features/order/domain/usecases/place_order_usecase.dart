import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';
import 'package:nestafar_task/features/order/domain/repositories/order_repository.dart';

class PlaceOrderUsecase extends Usecase<Datastate<bool>,OrderModel>{
  final OrderRepository orderRepository;

  PlaceOrderUsecase(this.orderRepository);

  @override
  Future<Datastate<bool>> call(OrderModel params) {
    return Future.delayed(
      Duration(milliseconds: 100),
          () => orderRepository.placeOrder(params),
    );
  }
}
