import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';

abstract class OrderRepository {
  //get orders
  Datastate<List<OrderModel>> getOrders();

  //place order
  Datastate<bool> placeOrder(OrderModel order);
}
