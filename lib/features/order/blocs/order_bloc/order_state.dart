import 'package:equatable/equatable.dart';
import 'package:nestafar_task/features/order/data/model/order_model.dart';

abstract class OrderState extends Equatable {
  final String? message;
  final List<OrderModel>? orders;

  //constructor
  const OrderState({this.message, this.orders});

  @override
  List<Object?> get props => [message, orders];
}

//intial state
class OrderInitialState extends OrderState {
  const OrderInitialState() : super(message: null, orders: null);
}

//loading state
class OrderLoadingState extends OrderState {
  const OrderLoadingState() : super(message: null, orders: null);
}

//success state
class OrderSuccessState extends OrderState {
  OrderSuccessState(List<OrderModel> orders)
    : super(message: null, orders: orders);
}

class OrderErrorState extends OrderState {
  OrderErrorState(String message) : super(message: message, orders: null);

}
