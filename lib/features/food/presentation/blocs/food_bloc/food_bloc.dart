import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_event.dart';
import 'package:nestafar_task/features/food/presentation/blocs/food_bloc/food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(): super(FoodInitialState()){
    //
  }

  //on get food call
  
}
