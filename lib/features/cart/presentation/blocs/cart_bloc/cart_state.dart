import 'package:equatable/equatable.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class CartState extends Equatable {
  final List<FoodModel>? cartItems;
  final String? errorMessage;
  final bool? response;

  const CartState({this.cartItems, this.errorMessage,this.response});

  @override
  List<Object?> get props => [cartItems,errorMessage,response];
}


//initial state
class CartInitialState extends CartState {
  CartInitialState() : super(cartItems: null, errorMessage: null,response: null);
}


//loading state
class CartLoadingState extends CartState {
  CartLoadingState() : super(cartItems: null, errorMessage: null,response: null);
}

//success state
class CartSuccessState extends CartState {
  CartSuccessState(List<FoodModel>? cartItems,bool? response) : super(cartItems: cartItems, errorMessage: null,response: response);
}

//error state
class CartErrorState extends CartState {
  CartErrorState(String message) : super(cartItems: null, errorMessage: message,response: null);
}

