import 'package:nestafar_task/features/order/data/model/order_model.dart';

class OrderDataService {
  ///list to store order details
   List<OrderModel> _orders = [];

  ///method to add order details to the list
  bool addOrder(OrderModel order) {
    _orders.add(order);
    return true;
  }

  ///method to get all order details from the list
  List<OrderModel> getOrders() {
    return _orders;
  }
}
