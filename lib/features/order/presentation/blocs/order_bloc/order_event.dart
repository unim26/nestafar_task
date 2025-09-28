import 'package:nestafar_task/features/order/data/model/order_model.dart';

abstract class OrderEvent {
  const OrderEvent();
}

// Event to load orders
class GetOrdersEvent extends OrderEvent {
  const GetOrdersEvent();
}

// Event to place a new order
class PlaceOrderEvent extends OrderEvent {
  final OrderModel order;
  const PlaceOrderEvent({required this.order});
}
