import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/order/data/data_services/order_data_service.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';
import 'package:nestafar_task/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataService orderDataService;

  OrderRepositoryImpl(this.orderDataService);

  @override
  Datastate<List<OrderModel>> getOrders() {
    try {
      final response = orderDataService.getOrders();

    if (response.isNotEmpty) {
      return DataSuccess(response);
    } else {
      return DataFailed( "No orders found");
    }
    } catch (e) {
      return DataFailed( "Error fetching orders");
    }
  }

  @override
  Datastate<bool> placeOrder(OrderModel order) {
    try {
      final response = orderDataService.addOrder(order);

      if (response) {
        return DataSuccess(true);
      } else {
        return DataFailed( "Failed to place order");
      }
    } catch (e) {
      return DataFailed( "Error placing order");
    }
  }
}
