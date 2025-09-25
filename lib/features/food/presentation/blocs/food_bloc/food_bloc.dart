import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/core/resources/datastate.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_category_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_by_id_usecase.dart';
import 'package:nestafar_task/features/food/domain/usecases/get_food_iteams_usecase.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  //usecases
  final GetFoodItemsUsecase _getFoodItemsUsecase;
  final GetFoodByCategoryUsecase _getFoodByCategoryUsecase;
  final GetFoodByIdUsecase _getFoodByIdUsecase;

  //constructure
  FoodBloc(
    this._getFoodByCategoryUsecase,
    this._getFoodByIdUsecase,
    this._getFoodItemsUsecase,
  ) : super(FoodInitialState()) {
    //on get food event
    on<GetFoodsEvent>(onGetFooodEventcall);

    on<GetFoodByCategoryEvent>(onGetFooodByCategoryEventcall);


    on<GetFoodByIdEvent>(onGetFooodByIdEventcall);

  }

  //on get food call
  void onGetFooodEventcall(GetFoodsEvent event, Emitter<FoodState> emit) async {
    //emit loading state
    emit(FoodLoadingState());

    //call api
    final datastate = await _getFoodItemsUsecase.call(null);

    if (datastate is DataSuccess) {
      //emit success state
      emit(FoodSuccessState(datastate.data,null));
    }

    if (datastate is DataFailed) {
      //emit error state
      emit(FoodErrorstate(datastate.message!));
    }


  }


 //on get food by category event call
 void onGetFooodByCategoryEventcall(GetFoodByCategoryEvent event, Emitter<FoodState> emit) async {
    //emit loading state
    emit(FoodLoadingState());

    //call api
    final datastate = await _getFoodByCategoryUsecase.call(event.category);

    if (datastate is DataSuccess) {
      //emit success state
      emit(FoodSuccessState(datastate.data,null));
    }

    if (datastate is DataFailed) {
      //emit error state
      emit(FoodErrorstate(datastate.message!));
    }


  }


  //on get foodby id event call
  void onGetFooodByIdEventcall(GetFoodByIdEvent event, Emitter<FoodState> emit) async {
    //emit loading state
    emit(FoodLoadingState());

    //call api
    final datastate = await _getFoodByIdUsecase.call(event.foodId);

    if (datastate is DataSuccess) {
      //emit success state
      emit(FoodSuccessState(state.foods,datastate.data));
    }

    if (datastate is DataFailed) {
      //emit error state
      emit(FoodErrorstate(datastate.message!));
    }


  }

}
