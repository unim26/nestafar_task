
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_event.dart';
import 'package:nestafar_task/features/order/presentation/blocs/order_bloc/order_state.dart';
import 'package:nestafar_task/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:nestafar_task/features/order/domain/usecases/place_order_usecase.dart';

 class OrderBloc extends Bloc<OrderEvent, OrderState> {
  //use cases
  final GetOrdersUsecase _getOrdersUsecase;
  final PlaceOrderUsecase _placeOrderUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;

  //constructor

  OrderBloc(
    this._getOrdersUsecase,
    this._placeOrderUsecase,
    this._removeFromCartUsecase,
  ) : super(OrderInitialState()) {
    //get orders event call
    on<GetOrdersEvent>(onGetOrderEventCall);

    //place order
    on<PlaceOrderEvent>(onPlaceOrderEventCall);
  }

  //on get order evevnt call
  void onGetOrderEventCall(
    GetOrdersEvent event,
    Emitter<OrderState> emit,
  ) async {
    //emit loading
    emit(OrderLoadingState());

    //datastate
    final datastate = await _getOrdersUsecase.call(null);

    //check response
    if (datastate is DataSuccess) {
      emit(OrderSuccessState(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(OrderErrorState(datastate.message!));
    }
  }

  //on get order evevnt call
  void onPlaceOrderEventCall(
    PlaceOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    //emit loading
    emit(OrderLoadingState());

    //place order
    await _placeOrderUsecase.call(event.order);

    //get orders
    final datastate = await _getOrdersUsecase.call(null);

    //remove items from cart
    for (var i = 0; i < event.order.items.length; i++) {
      await _removeFromCartUsecase.call(event.order.items[i].id!);
    }

    //check response
    if (datastate is DataSuccess) {
      emit(OrderSuccessState(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(OrderErrorState(datastate.message!));
    }
  }
}
