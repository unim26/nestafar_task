import 'package:equatable/equatable.dart';
import 'package:nestafar_task/features/food/data/models/food_model.dart';

abstract class CartState extends Equatable {
  final List<FoodModel>? CartIteams;
  final String? errorMessage;
  final bool? response;

  const CartState({this.CartIteams, this.errorMessage,this.response});

  @override
  List<Object?> get props => [CartIteams,errorMessage,response];
}


//initial state
class CartInitialState extends CartState {
  CartInitialState() : super(CartIteams: null, errorMessage: null,response: null);
}


//loading state
class CartLoadingState extends CartState {
  CartLoadingState() : super(CartIteams: null, errorMessage: null,response: null);
}

//success state
class CartSuccessState extends CartState {
  CartSuccessState(List<FoodModel>? CartIteams,bool? response) : super(CartIteams: CartIteams, errorMessage: null,response: response);
}

//error state
class CartErrorState extends CartState {
  CartErrorState(String message) : super(CartIteams: null, errorMessage: message,response: null);
}

