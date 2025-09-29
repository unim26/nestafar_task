import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/get_cart_iteams_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //usecases
  final GetCartIteamsUsecase _getCartIteamsUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;

  //constructure
  CartBloc(
    this._getCartIteamsUsecase,
    this._addToCartUsecase,
    this._removeFromCartUsecase,
  ) : super(CartInitialState()) {
    //on get cart items event
    on<GetCartItemsEvent>(onGetCartItemsCall);
    //on add to cart event
    on<AddToCartEvent>(onAddToCartCall);
    //on remove from cart event
    on<RemoveFromCartEvent>(onRemoveFromCartCall);
  }

  //on get cart items event call
  void onGetCartItemsCall(
    GetCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    print('calling ')
    //emit loading state
    emit(CartLoadingState());
    //call api
    final datastate = await _getCartIteamsUsecase.call(null);
    if (datastate is DataSuccess) {
      //emit success state
      emit(CartSuccessState(datastate.data, null));
    }
    if (datastate is DataFailed) {
      //emit error state
      emit(CartErrorState(datastate.message!));
    }
  }

  //remove from cart call
  void onRemoveFromCartCall(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    //emit loading state
    emit(CartLoadingState());
    //call api
    await _removeFromCartUsecase.call(event.foodId);

    final datastate = await _getCartIteamsUsecase.call(null);
    if (datastate is DataSuccess) {
      //emit success state
      emit(CartSuccessState(datastate.data, null));
    }
    if (datastate is DataFailed) {
      //emit error state
      emit(CartErrorState(datastate.message!));
    }
  }

  //on add to cart event call
  void onAddToCartCall(AddToCartEvent event, Emitter<CartState> emit) async {
    //emit loading state
    emit(CartLoadingState());

    //call api
    final datastate = await _addToCartUsecase.call(event.food);

    if (datastate is DataSuccess) {
      //emit success state
      emit(CartSuccessState(null, datastate.data));
    }

    if (datastate is DataFailed) {
      //emit error state
      emit(CartErrorState(datastate.message!));
    }
  }


  }
