import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/core/resources/usecase.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';
import 'package:nestafar_task/features/order/domain/repositories/order_repository.dart';

class GetOrdersUsecase extends Usecase<Datastate<List<OrderModel>>, Null> {
  final OrderRepository orderRepository;

  GetOrdersUsecase(this.orderRepository);

  @override
  Future<Datastate<List<OrderModel>>> call(Null params) {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => orderRepository.getOrders(),
    );
  }
}
