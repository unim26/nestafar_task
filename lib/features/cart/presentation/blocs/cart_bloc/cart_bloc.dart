import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:nestafar_task/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:nestafar_task/features/cart/presentation/blocs/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  //usecases
  final AddToCartUsecase _addToCartUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;

  //constructure
  CartBloc(
    this._addToCartUsecase,
    this._removeFromCartUsecase,
    this._updateCartUsecase,
  ) : super(CartInitialState()){
   //

  }

  //on add to cart event call
  void onAddToCartCall(AddToCartEvent event, Emitter<CartState> emit) async{
    
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


  //on update cart call
  void onUpdateCartCall(UpdateCartEvent event, Emitter<CartState> emit) async{
    
    //emit loading state
    emit(CartLoadingState());

    //call api
    final datastate = await _addToCartUsecase.call(event.food);

    //TODO check this

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